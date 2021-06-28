/**
 * @description       : 
 * @author            : Amit Kumar
 * @group             : 
 * @last modified on  : 06-28-2021
 * @last modified by  : Amit Kumar
 * Modifications Log 
 * Ver   Date         Author       Modification
 * 1.0   06-22-2021   Amit Kumar   Initial Version
**/

public inherited sharing class Covid19CalloutManager {
       
    public Covid19StatisticsWrapper getStatistics(String country){
        String endpoint = 'https://covid-193.p.rapidapi.com/statistics?country='+country;
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint(endpoint);
        request.setHeader('X-RapidAPI-Key', '7b4268cb01mshc657b96f3e68174p1737f7jsn4a892bbc09bb');
        HttpResponse response = new Http().send(request);
        Covid19StatisticsWrapper statWrapper = Covid19StatisticsWrapper.parse(response.getBody());
        return statWrapper;
    }
    
    public Covid19CountriesWrapper getCountries(){
        String endpoint = 'https://covid-193.p.rapidapi.com/countries';
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint(endpoint);
        request.setHeader('X-RapidAPI-Key', '7b4268cb01mshc657b96f3e68174p1737f7jsn4a892bbc09bb');
        HttpResponse response = new Http().send(request);
        Covid19CountriesWrapper countriesWrapper = Covid19CountriesWrapper.parse(response.getBody());
        return countriesWrapper;
    }
}
