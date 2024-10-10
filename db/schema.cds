namespace com.logaligroup;

using {
    cuid,
    managed,
    sap.common.CodeList
} from '@sap/cds/common';


entity Products : cuid, managed {
    product     : String(7);
    productName : String(40);
    description : LargeString;
    supplier    : Association to Suppliers;
    category    : Association to Categories;
    subCategory : Association to SubCategories;
    stock       : Association to Status;
    rating      : Decimal(4, 2) @assert.range  : [
        1.00,
        5.00
    ];
    content     : LargeBinary   @Core.MediaType: mediaType  @Core.ContentDisposition.Filename  @UI.IsImage;
    mediaType   : String        @Core.Core.IsMediaType;
    fileName    : String;
    price       : Decimal(6, 2) @Measures.Unit : currency;
    currency    : String        @Common.IsCurrency;
};

entity Details : cuid {
    baseUnit   : String default 'EA';
    width      : Decimal(6, 2);
    heigth     : Decimal(6, 2);
    depth      : Decimal(6, 2);
    unitVolume : String default 'CM';
    unitWeight : String default 'KG';
};

entity Suppliers : cuid {
    supplier     : String(9);
    supplierName : String;
    webAddress   : String;
    contact      : Composition of Contacts;
};

entity Contacts : cuid {
    fullName    : String(40);
    email       : String(80);
    phoneNumber : String(14);
};

entity Categories : cuid {
    category        : String;
    description     : String;
    toSubCategories : Composition of many SubCategories
                          on toSubCategories.category = $self;
};

entity SubCategories : cuid {
    subCategory : String;
    description : String;
    category    : Association to Categories;
};

entity Status : CodeList {
    key code        : String enum {
            Available       = 'In Stock';
            LowAvailability = 'Low Availability';
            NotAvailable    = 'In Not Stock';
        };
        criticality : Int16;
}
