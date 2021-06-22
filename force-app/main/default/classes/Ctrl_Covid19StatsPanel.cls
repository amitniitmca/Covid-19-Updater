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
public inherited sharing class Ctrl_Covid19StatsPanel {
    @AuraEnabled(cacheable=true)
    public static Map<String, String> getCountryInformation(Id accountId){
        Account accountObject = new AccountsController().getCountyDetails(accountId);
        if(accountObject.BillingCountry == null || accountObject.ShippingCountry == null){
            return null;    
        }
        Map<String, String> mapObject = new Map<String, String>();
        mapObject.put('BillingCountry', accountObject.BillingCountry);
        mapObject.put('ShippingCountry', accountObject.ShippingCountry);
        return mapObject;
    }
    
    @AuraEnabled(cacheable=true)
    public static Map<String, String> getCovidStatsFor(String country){
        Covid19StatisticsWrapper covidWrapper = new Covid19CalloutManager().getStatistics(country);
        Map<String, String> mapObject = new Map<String, String>();
        mapObject.put('ReportDate', covidWrapper.response[0].day); 
        mapObject.put('NewCases', covidWrapper.response[0].cases.new_Z);
        mapObject.put('ActiveCases', String.valueOf(covidWrapper.response[0].cases.active));
        mapObject.put('CriticalCases', String.valueOf(covidWrapper.response[0].cases.critical));
        mapObject.put('RecoveredCases', String.valueOf(covidWrapper.response[0].cases.recovered));
        mapObject.put('TotalCases', String.valueOf(covidWrapper.response[0].cases.total));
        mapObject.put('OneMCases', covidWrapper.response[0].cases.OneM_pop);
        mapObject.put('TotalTests', String.valueOf(covidWrapper.response[0].tests.total));
        mapObject.put('OneMTests', covidWrapper.response[0].tests.OneM_pop);
        mapObject.put('OneMDeaths', covidWrapper.response[0].deaths.OneM_pop);
        mapObject.put('NewDeaths', covidWrapper.response[0].deaths.new_Z);
        mapObject.put('TotalDeaths', String.valueOf(covidWrapper.response[0].deaths.total));
        return mapObject;
    }
    
    @AuraEnabled(cacheable=true)
    public static List<String> getCountries(){
        Covid19CountriesWrapper countriesWrapper = new Covid19CalloutManager().getCountries();
        return countriesWrapper.response;
    }
}
