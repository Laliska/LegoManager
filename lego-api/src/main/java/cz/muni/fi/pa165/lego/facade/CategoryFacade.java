package cz.muni.fi.pa165.lego.facade;

import cz.muni.fi.pa165.lego.dto.CategoryDTO;

import java.util.List;

/**
 * CategoryFacade defines operations available within the Lego API to simplify
 * the usage of the application.
 *
 * @author Sona Mastrakova <sona.mastrakova@gmail.com>
 * @date 11.11.2015
 */
public interface CategoryFacade {

    /**
     * Create the given category.
     *
     * @param categoryDTO category to be created
     * @return id of the created category
     */
    Long create(CategoryDTO categoryDTO);

    /**
     * Update the given category.
     *
     * @param categoryDTO category to be updated
     */
    void update(CategoryDTO categoryDTO, Long id);

    /**
     * Delete the given category.
     *
     * @param id id of the category
     */
    void delete(Long id);

    /**
     * Get category with the given ID.
     *
     * @param id id of the category
     * @return existing category with given id
     */
    CategoryDTO findById(Long id);

    /**
     * Get category with the given name.
     *
     * @param name name of the category
     * @return existing category with given name
     */
    CategoryDTO findByName(String name);

    /**
     * Get all existing categories.
     *
     * @return list of existing categories
     */
    List<CategoryDTO> findAll();

}
