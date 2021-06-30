/**
 * @description       : 
 * @author            : Amit Kumar
 * @group             : 
 * @last modified on  : 06-30-2021
 * @last modified by  : Amit Kumar
 * Modifications Log 
 * Ver   Date         Author       Modification
 * 1.0   06-30-2021   Amit Kumar   Initial Version
**/
@IsTest
public inherited sharing class TestCovid19CalloutManager {
    @IsTest
    static void testGetStatistics(){
        HttpResponse response = new HttpResponse( );
		response.setBody('{"get":"statistics","parameters":{"country":"India"},"errors":[],"results":1,"response":[{"continent":"Asia","country":"India","population":1393346055,"cases":{"new":"+863","active":586374,"critical":8944,"recovered":29251029,"1M_pop":"21698","total":30233183},"deaths":{"new":null,"1M_pop":"284","total":395780},"tests":{"1M_pop":"290140","total":404265101},"day":"2021-06-27","time":"2021-06-27T14:15:03+00:00"}]}');
		response.setStatus('OK');
		response.setStatusCode(200);
        Covid19StatisticsWrapper expectedWrapper = Covid19StatisticsWrapper.parse(response.getBody());
        
        fflib_ApexMocks mocks = new fflib_ApexMocks( );
		UpdatedHttpCalloutMock calloutMock = ( UpdatedHttpCalloutMock)mocks.mock(UpdatedHttpCalloutMock.class);
        Test.setMock(HttpCalloutMock.class, calloutMock);
		
		mocks.startStubbing();
		mocks.when(calloutMock.respond(( HttpRequest)fflib_Match.anyObject())).thenReturn(response);
		mocks.stopStubbing();
        
        Test.startTest();
        Covid19StatisticsWrapper actualWrapper = Covid19CalloutManager.newInstance().getStatistics('India');
        Test.stopTest();
        
        System.assertEquals(expectedWrapper.parameters.country, actualWrapper.parameters.country, 'Parameter Country not matching!');       
        System.assertEquals(expectedWrapper.response[0].country, actualWrapper.response[0].country, 'Response Country not matching!');
        System.assertEquals(expectedWrapper.response[0].continent, actualWrapper.response[0].continent, 'Response Continent not matching!');
        System.assertEquals(expectedWrapper.response[0].day, actualWrapper.response[0].day, 'Response Day not matching!');
        System.assertEquals(expectedWrapper.response[0].time_Z, actualWrapper.response[0].time_Z, 'Response Time Zone not matching!'); 
        System.assertEquals(expectedWrapper.response[0].cases.OneM_pop, actualWrapper.response[0].cases.OneM_pop, 'Cases per one million not matching!');
        System.assertEquals(expectedWrapper.response[0].cases.active, actualWrapper.response[0].cases.active, 'Cases active not matching!');
        System.assertEquals(expectedWrapper.response[0].cases.critical, actualWrapper.response[0].cases.critical, 'Cases critical not matching!');
        System.assertEquals(expectedWrapper.response[0].cases.new_Z, actualWrapper.response[0].cases.new_Z, 'Cases new matching!');
        System.assertEquals(expectedWrapper.response[0].cases.recovered, actualWrapper.response[0].cases.recovered, 'Cases recovered not matching!');
        System.assertEquals(expectedWrapper.response[0].cases.total, actualWrapper.response[0].cases.total, 'Cases total not matching!');
        System.assertEquals(expectedWrapper.response[0].tests.OneM_pop, actualWrapper.response[0].tests.OneM_pop, 'Tests per one million not matching!');
        System.assertEquals(expectedWrapper.response[0].tests.total, actualWrapper.response[0].tests.total, 'Tests total not matching!');
        System.assertEquals(expectedWrapper.response[0].deaths.OneM_pop, actualWrapper.response[0].deaths.OneM_pop, 'Deaths per one million not matching!');
        System.assertEquals(expectedWrapper.response[0].deaths.new_Z, actualWrapper.response[0].deaths.new_Z, 'Deaths new matching!');
        System.assertEquals(expectedWrapper.response[0].deaths.total, actualWrapper.response[0].deaths.total, 'Deaths total not matching!');
    }
    
    @IsTest
    static void testGetCountries(){
        HttpResponse response = new HttpResponse( );
		response.setBody('{"get":"countries","parameters":[],"errors":[],"results":227,"response":["Afghanistan","Albania","Algeria","Andorra","Angola","Anguilla","Antigua-and-Barbuda","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia-and-Herzegovina","Botswana","Brazil","British-Virgin-Islands","Brunei","Bulgaria","Burkina-Faso","Burundi","Cabo-Verde","Cambodia","Cameroon","Canada","CAR","Caribbean-Netherlands","Cayman-Islands","Chad","Channel-Islands","Chile","China","Colombia","Comoros","Congo","Costa-Rica","Croatia","Cuba","Curaçao","Cyprus","Czechia","Denmark","Diamond-Princess","Diamond-Princess-","Djibouti","Dominica","Dominican-Republic","DRC","Ecuador","Egypt","El-Salvador","Equatorial-Guinea","Eritrea","Estonia","Eswatini","Ethiopia","Faeroe-Islands","Falkland-Islands","Fiji","Finland","France","French-Guiana","French-Polynesia","Gabon","Gambia","Georgia","Germany","Ghana","Gibraltar","Greece","Greenland","Grenada","Guadeloupe","Guam","Guatemala","Guinea","Guinea-Bissau","Guyana","Haiti","Honduras","Hong-Kong","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","Isle-of-Man","Israel","Italy","Ivory-Coast","Jamaica","Japan","Jordan","Kazakhstan","Kenya","Kuwait","Kyrgyzstan","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macao","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Marshall-Islands","Martinique","Mauritania","Mauritius","Mayotte","Mexico","Micronesia","Moldova","Monaco","Mongolia","Montenegro","Montserrat","Morocco","Mozambique","MS-Zaandam","MS-Zaandam-","Myanmar","Namibia","Nepal","Netherlands","New-Caledonia","New-Zealand","Nicaragua","Niger","Nigeria","North-Macedonia","Norway","Oman","Pakistan","Palestine","Panama","Papua-New-Guinea","Paraguay","Peru","Philippines","Poland","Portugal","Puerto-Rico","Qatar","Réunion","Romania","Russia","Rwanda","S-Korea","Saint-Helena","Saint-Kitts-and-Nevis","Saint-Lucia","Saint-Martin","Saint-Pierre-Miquelon","Samoa","San-Marino","Sao-Tome-and-Principe","Saudi-Arabia","Senegal","Serbia","Seychelles","Sierra-Leone","Singapore","Sint-Maarten","Slovakia","Slovenia","Solomon-Islands","Somalia","South-Africa","South-Sudan","Spain","Sri-Lanka","St-Barth","St-Vincent-Grenadines","Sudan","Suriname","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","Timor-Leste","Togo","Trinidad-and-Tobago","Tunisia","Turkey","Turks-and-Caicos","UAE","Uganda","UK","Ukraine","Uruguay","US-Virgin-Islands","USA","Uzbekistan","Vanuatu","Vatican-City","Venezuela","Vietnam","Wallis-and-Futuna","Western-Sahara","Yemen","Zambia","Zimbabwe"]}');
		response.setStatus('OK');
		response.setStatusCode(200);
		Covid19CountriesWrapper expectedWrapper = Covid19CountriesWrapper.parse(response.getBody());

		fflib_ApexMocks mocks = new fflib_ApexMocks( );
		UpdatedHttpCalloutMock calloutMock = ( UpdatedHttpCalloutMock)mocks.mock(UpdatedHttpCalloutMock.class);
		// UpdatedHttpCalloutMock.instance = calloutMock;

		mocks.startStubbing();
		mocks.when( calloutMock.respond(( HttpRequest)fflib_Match.anyObject())).thenReturn(response);
		mocks.stopStubbing();

		Test.startTest();
		Test.setMock(HttpCalloutMock.class, calloutMock);
		Covid19CountriesWrapper actualWrapper = Covid19CalloutManager.newInstance().getCountries();
		Test.stopTest();
		System.assertEquals(expectedWrapper.response, actualWrapper.response, 'Response not matching!');
    }
}
