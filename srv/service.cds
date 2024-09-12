using {com.logaligroup as entities} from '../db/schema';

service LogaliGroup {

    entity ProductsSet as projection on entities.Products;
    entity DetailsSet as projection on entities.Details;
    entity SuppliersSet as projection on entities.Suppliers;
    entity ContactsSet as projection on entities.Contacts;
    
    /**Entidades para las listas de valores (@Common.ValueList) */
    @readonly
    entity VH_CategoriesSet as projection on entities.Categories;
    @readonly
    entity VH_SubCategoriesSet as projection on entities.SubCategories;
    @readonly
    entity VH_Stock as projection on entities.Status;
}