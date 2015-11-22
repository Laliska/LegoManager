package cz.muni.fi.pa165.lego.service.facade;

import cz.muni.fi.pa165.lego.dto.CategoryCreateDTO;
import cz.muni.fi.pa165.lego.dto.CategoryDTO;
import cz.muni.fi.pa165.lego.facade.CategoryFacade;
import cz.muni.fi.pa165.lego.service.BeanMappingService;
import java.util.List;

import cz.muni.fi.pa165.lego.service.CategoryService;
import cz.muni.fi.pa165.legomanager.entities.Category;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * CategoryFacadeImpl implements {@link CategoryFacade}.
 *
 * @author Sona Mastrakova <sona.mastrakova@gmail.com>
 * @date 21.11.2015
 */
@Service
@Transactional
public class CategoryFacadeImpl implements CategoryFacade {

    @Inject
    private CategoryService categoryService;

    @Inject
    private BeanMappingService mappingService;

    @Override
    public void createCategory(CategoryCreateDTO categoryCreateDTO) {
        categoryService.create(mappingService.mapTo(categoryCreateDTO, Category.class));
    }

    @Override
    public void updateCategory(CategoryDTO categoryDTO) {
        categoryService.update(mappingService.mapTo(categoryDTO, Category.class));
    }

    @Override
    public void deleteCategory(Long id) {
        categoryService.delete(categoryService.findById(id));
    }

    @Override
    public CategoryDTO getCategoryById(Long id) {
        return mappingService.mapTo(categoryService.findById(id), CategoryDTO.class);
    }

    @Override
    public CategoryDTO getCategoryByName(String name) {
        return mappingService.mapTo(categoryService.findByName(name), CategoryDTO.class);
    }

    @Override
    public List<CategoryDTO> getAllCategories() {
        return mappingService.mapTo(categoryService.findAll(), CategoryDTO.class);
    }

}
