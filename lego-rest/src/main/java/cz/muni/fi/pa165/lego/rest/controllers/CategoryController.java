package cz.muni.fi.pa165.lego.rest.controllers;

import cz.muni.fi.pa165.lego.dto.CategoryDTO;
import cz.muni.fi.pa165.lego.facade.CategoryFacade;
import java.util.List;
import javax.inject.Inject;
import javax.validation.Valid;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 * REST Controller for Category
 * 
 * @author Tobias Kamenicky <tobias.kamenicky@gmail.com>
 * @date 11.12.2015
 */
@RestController
@RequestMapping("/categories")
public class CategoryController {
    
    private final static Logger log = LoggerFactory.getLogger(CategoryController.class);
    
    @Inject
    private CategoryFacade categoryFacade;
    
    /**
     * Create category with given parametres
     *
     * example:
     * curl -X POST -H "Accept:application/json" -H "Content-Type:application/json"
     * http://localhost:8080/pa165/rest/categories/create
     * -d '{"name":"Star Wars","description":"Category for star wars models."}'
     * | python -m json.tool
     *
     * @param categoryDTO DTO to be created
     * @return created Category
     */
    @RequestMapping(value = "/create", method = RequestMethod.POST,
            consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public final CategoryDTO createCategory(@Valid @RequestBody CategoryDTO categoryDTO) {
        log.debug("rest createCategory()");
        
        Long id = categoryFacade.create(categoryDTO);
        return categoryFacade.findById(id);
    }

    /**
     * Update Category with given id.
     *
     * example:
     * curl -X PUT -H "Content-Type:application/json"
     * http://localhost:8080/pa165/rest/categories/1
     * -d '{"name":"Cars","description":"Category for all cars."}'
     *
     * @param id id of updated Category
     * @param categoryDTO new updated category
     * @return categoryDTO
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.PUT,
            consumes = MediaType.APPLICATION_JSON_VALUE)
    public final CategoryDTO updateCategory(
            @PathVariable("id") long id, 
            @Valid @RequestBody CategoryDTO categoryDTO) {

        log.debug("rest updateCategory({})", id);
        categoryFacade.update(categoryDTO, id);
        return categoryFacade.findByName(categoryDTO.getName());
    }    

    /**
     * Delete Category defined by its id
     *
     * example:
     * curl -X DELETE http://localhost:8080/pa165/rest/categories/1
     *
     * @param id of category
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public final void deleteCategory(@PathVariable("id") long id) {
        log.debug("rest deleteCategory({})", id);

        categoryFacade.delete(id);
    }

    /**
     * get Category defined by its id. If identifier is not numeric it tries to find Category by its name.
     *
     * example:
     * curl -H "Accept:application/json" http://localhost:8080/pa165/rest/categories/1 | python -m json.tool
     *
     * @param identifier Text or can be numeric. if it is numeric it tries to find Category by id.
     *                   If not it tries to find Category by name.
     * @return Category with given identifier
     */
    @RequestMapping(value = "/{identifier}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public final CategoryDTO getCategory(@PathVariable("identifier") String identifier) {
        log.debug("rest getCategory({})", identifier);

        CategoryDTO categoryDTO;

        // is integer?
        if (identifier.matches("^-?\\d+$")) {
            categoryDTO = categoryFacade.findById(Long.parseLong(identifier));
        } else {
            categoryDTO = categoryFacade.findByName(identifier);
        }

        return categoryDTO;
    }

    /**
     * get all categories from the system
     *
     * example:
     * curl -H "Accept:application/json" http://localhost:8080/pa165/rest/categories | python -m json.tool
     *
     * @return List of all categories
     */
    @RequestMapping(method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public final List<CategoryDTO> getCategories() {
        log.debug("rest getCategories()");

        return categoryFacade.findAll();
    }
    
    /**
     * Handles Exception throw during processing REST actions
     */
    @ResponseStatus(value= HttpStatus.BAD_REQUEST, 
            reason = "Cannot perform requested operation on categories. "
                    + "If you call create operation, categories may already exist. "
                    + "If you call delete operation, categories may already been removed. "
                    + "If you call get operation, be sure that categories is already in the system.")
    @ExceptionHandler(Exception.class)
    public void notFound() {
    }
}
