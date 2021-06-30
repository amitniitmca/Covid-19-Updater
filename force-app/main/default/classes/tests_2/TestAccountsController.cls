/**
 * @description       : 
 * @author            : Amit Kumar
 * @group             : 
 * @last modified on  : 06-29-2021
 * @last modified by  : Amit Kumar
 * Modifications Log 
 * Ver   Date         Author       Modification
 * 1.0   06-29-2021   Amit Kumar   Initial Version
**/
@IsTest
public inherited sharing class TestAccountsController {
    @IsTest
    static void testGetCountryDetails(){
        Account expectedObject = new Account();
        expectedObject.Name = 'Test Account';
        expectedObject.BillingCountry = 'India';
        expectedObject.ShippingCountry = 'Canada';
        INSERT expectedObject;
        Test.startTest();
        Account actualObject = new AccountsController().getCountyDetails(expectedObject.Id);
        Test.stopTest();
        System.assertEquals(expectedObject.Name, actualObject.Name, '"Account" - Name not matching!');
        System.assertEquals(expectedObject.BillingCountry, actualObject.BillingCountry, '"Account" - BillingCountry not matching!');
        System.assertEquals(expectedObject.ShippingCountry, actualObject.ShippingCountry, '"Account" - ShippingCountry not matching!');
    }
}
