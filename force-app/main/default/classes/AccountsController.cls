/**
 * @description       : 
 * @author            : Amit Kumar
 * @group             : 
 * @last modified on  : 06-30-2021
 * @last modified by  : Amit Kumar
 * Modifications Log 
 * Ver   Date         Author       Modification
 * 1.0   06-22-2021   Amit Kumar   Initial Version
**/
public inherited sharing class AccountsController {
    @TestVisible
    private static AccountsController instance = null;
    
    public static AccountsController newInstance(){
        if(instance == null){
            instance = new AccountsController();    
        }
        return instance;
    }
    
    public Account getCountyDetails(Id accountId){
        return [SELECT Id , Name, BillingCountry, ShippingCountry FROM Account WHERE Id =: accountId];
    }
}