/**
 * @description       : 
 * @author            : Amit Kumar
 * @group             : 
 * @last modified on  : 06-22-2021
 * @last modified by  : Amit Kumar
 * Modifications Log 
 * Ver   Date         Author       Modification
 * 1.0   06-22-2021   Amit Kumar   Initial Version
**/
public inherited sharing class AccountsController {
    public Account getCountyDetails(Id accountId){
        return [SELECT Id , Name, BillingCountry, ShippingCountry FROM Account WHERE Id =: accountId];
    }
}
