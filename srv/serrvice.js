const cds = require("@sap/cds");

module.exports = class LogaliGroup extends cds.ApplicationService {

    onInit() {

        const {
            ProductsSet,
            SuppliersSet
        } = this.entities;

        this.before('NEW', ProductsSet.drafts, (req) => {
            req.data.details??={
                baseUnit: "EA",
                width: 0.00,
                heigth: 0.00,
                depth: 0.00,
                weight: 0.00,
                unitVolume: "CM",
                unitWeight: "KG"
            };
        });

        this.before('NEW', SuppliersSet.drafts, (req) =>{
            req.data.contact??={
                fullName: "",
                phoneNumber: "",
                email:""
            }
        });

        return super.init();
    }

};