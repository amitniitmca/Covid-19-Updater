/**
 * @description       :
 * @author            : Amit Kumar
 * @group             :
 * @last modified on  : 06-30-2021
 * @last modified by  : Amit Kumar
 * Modifications Log
 * Ver   Date         Author       Modification
 * 1.0   06-29-2021   Amit Kumar   Initial Version
 **/
@IsTest
public inherited sharing class TestCtrl_Covid19StatsPanel{
	@IsTest
	static void testGetCountryInformation(){
		Account acc = new Account();
		acc.Name = 'Test Account 1';
		acc.BillingCountry = 'India';
		acc.ShippingCountry = 'Canada';
		Id accountId = fflib_IdGenerator.generate(Account.SObjectType);

		fflib_ApexMocks mocks = new fflib_ApexMocks( );
		AccountsController controllerMock = ( AccountsController)mocks.mock(AccountsController.class);
		AccountsController.instance = controllerMock;

		mocks.startStubbing();
		mocks.when( controllerMock.getCountyDetails(accountId)).thenReturn(acc);
		mocks.stopStubbing();

		Test.startTest();
		Map<String, String> recievingMap = Ctrl_Covid19StatsPanel.getCountryInformation(accountId);
		Test.stopTest();

		System.assertEquals(recievingMap.get('BillingCountry'), acc.BillingCountry, 'Billing Country not matching!');
		System.assertEquals(recievingMap.get('ShippingCountry'), acc.ShippingCountry, 'Shipping Country not matching!');
	}

	@IsTest
	static void testGetCountryInformationForNull(){
		Account acc = new Account();
		acc.Name = 'Test Account 1';
		Id accountId = fflib_IdGenerator.generate(Account.SObjectType);

		fflib_ApexMocks mocks = new fflib_ApexMocks( );
		AccountsController controllerMock = ( AccountsController)mocks.mock(AccountsController.class);
		AccountsController.instance = controllerMock;

		mocks.startStubbing();
		mocks.when( controllerMock.getCountyDetails(accountId)).thenReturn(acc);
		mocks.stopStubbing();

		Test.startTest();
		Map<String, String> recievingMap = Ctrl_Covid19StatsPanel.getCountryInformation(accountId);
		Test.stopTest();

		System.assertEquals(recievingMap, null, 'Returning value is not null!');
	}

	@IsTest
	static void testGetCovidStatsFor(){
		HttpResponse response = new HttpResponse( );
		response.setBody('{"get":"statistics","parameters":{"country":"India"},"errors":[],"results":1,"response":[{"continent":"Asia","country":"India","population":1393346055,"cases":{"new":"+863","active":586374,"critical":8944,"recovered":29251029,"1M_pop":"21698","total":30233183},"deaths":{"new":null,"1M_pop":"284","total":395780},"tests":{"1M_pop":"290140","total":404265101},"day":"2021-06-27","time":"2021-06-27T14:15:03+00:00"}]}');
		response.setStatus('OK');
		response.setStatusCode(200);
		Covid19StatisticsWrapper expectedWrapper = Covid19StatisticsWrapper.parse(response.getBody());

		fflib_ApexMocks mocks = new fflib_ApexMocks( );
		UpdatedHttpCalloutMock calloutMock = ( UpdatedHttpCalloutMock)mocks.mock(UpdatedHttpCalloutMock.class);
		
		mocks.startStubbing();
		mocks.when( calloutMock.respond(( HttpRequest)fflib_Match.anyObject())).thenReturn(response);
		mocks.stopStubbing();

		Test.startTest();
		Test.setMock(HttpCalloutMock.class, calloutMock);
		Map<String, String> mapObject = Ctrl_Covid19StatsPanel.getCovidStatsFor('India');
		Test.stopTest();

		System.assertEquals(expectedWrapper.response[0].day, mapObject.get('ReportDate'), 'Reporting Date not matching !');
		System.assertEquals(expectedWrapper.response[0].cases.new_Z, mapObject.get('NewCases'), 'New Cases not matching !');
		System.assertEquals(String.valueOf(expectedWrapper.response[0].cases.active), mapObject.get('ActiveCases'), 'Active Cases not matching !');
		System.assertEquals(String.valueOf(expectedWrapper.response[0].cases.critical), mapObject.get('CriticalCases'), 'Critical Cases not matching !');
		System.assertEquals(String.valueOf(expectedWrapper.response[0].cases.recovered), mapObject.get('RecoveredCases'), 'Recovered Cases not matching !');
		System.assertEquals(String.valueOf(expectedWrapper.response[0].cases.total), mapObject.get('TotalCases'), 'Total Cases not matching !');
		System.assertEquals(expectedWrapper.response[0].cases.OneM_pop, mapObject.get('OneMCases'), 'One million cases not matching !');
		System.assertEquals(String.valueOf(expectedWrapper.response[0].tests.total), mapObject.get('TotalTests'), 'Total Tests not matching !');
		System.assertEquals(expectedWrapper.response[0].tests.OneM_pop, mapObject.get('OneMTests'), 'One million Tests not matching !');
		System.assertEquals(expectedWrapper.response[0].deaths.OneM_pop, mapObject.get('OneMDeaths'), 'One million Deaths not matching !');
		System.assertEquals(expectedWrapper.response[0].deaths.new_Z, mapObject.get('NewDeaths'), 'New Deaths not matching !');
		System.assertEquals(String.valueOf(expectedWrapper.response[0].deaths.total), mapObject.get('TotalDeaths'), 'Total Deaths not matching !');
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
		
		mocks.startStubbing();
		mocks.when( calloutMock.respond(( HttpRequest)fflib_Match.anyObject())).thenReturn(response);
		mocks.stopStubbing();

		Test.startTest();
		Test.setMock(HttpCalloutMock.class, calloutMock);
		List<String> actualResponse = Ctrl_Covid19StatsPanel.getCountries();
		Test.stopTest();
		System.assertEquals(expectedWrapper.response, actualResponse, 'Response not matching!');
	}
}