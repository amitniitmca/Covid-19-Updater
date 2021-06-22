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
@IsTest
public inherited sharing class Test_Covid19StatisticsWrapper {
    @IsTest
    static void testParse() {
		String json = '{'+
		'    \"get\": \"statistics\",'+
		'    \"parameters\": {'+
		'        \"country\": \"India\"'+
		'    },'+
		'    \"errors\": [],'+
		'    \"results\": 1,'+
		'    \"response\": ['+
		'        {'+
		'            \"continent\": \"Asia\",'+
		'            \"country\": \"India\",'+
		'            \"population\": 1393123813,'+
		'            \"cases\": {'+
		'                \"new\": \"+39096\",'+
		'                \"active\": 670998,'+
		'                \"critical\": 8944,'+
		'                \"recovered\": 28913191,'+
		'                \"1M_pop\": \"21515\",'+
		'                \"total\": 29973457'+
		'            },'+
		'            \"deaths\": {'+
		'                \"new\": \"+846\",'+
		'                \"1M_pop\": \"279\",'+
		'                \"total\": 389268'+
		'            },'+
		'            \"tests\": {'+
		'                \"1M_pop\": \"281675\",'+
		'                \"total\": 392407782'+
		'            },'+
		'            \"day\": \"2021-06-22\",'+
		'            \"time\": \"2021-06-22T01:00:02+00:00\"'+
		'        }'+
		'    ]'+
		'}';
		Covid19StatisticsWrapper r = Covid19StatisticsWrapper.parse(json);
		System.assert(r != null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		Covid19StatisticsWrapper.Response objResponse = new Covid19StatisticsWrapper.Response(System.JSON.createParser(json));
		System.assert(objResponse != null);
		System.assert(objResponse.continent == null);
		System.assert(objResponse.country == null);
		System.assert(objResponse.population == null);
		System.assert(objResponse.cases == null);
		System.assert(objResponse.deaths == null);
		System.assert(objResponse.tests == null);
		System.assert(objResponse.day == null);
		System.assert(objResponse.time_Z == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		Covid19StatisticsWrapper.Errors objErrors = new Covid19StatisticsWrapper.Errors(System.JSON.createParser(json));
		System.assert(objErrors != null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		Covid19StatisticsWrapper.Parameters objParameters = new Covid19StatisticsWrapper.Parameters(System.JSON.createParser(json));
		System.assert(objParameters != null);
		System.assert(objParameters.country == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		Covid19StatisticsWrapper objCovid19StatisticsWrapper = new Covid19StatisticsWrapper(System.JSON.createParser(json));
		System.assert(objCovid19StatisticsWrapper != null);
		System.assert(objCovid19StatisticsWrapper.get == null);
		System.assert(objCovid19StatisticsWrapper.parameters == null);
		System.assert(objCovid19StatisticsWrapper.errors == null);
		System.assert(objCovid19StatisticsWrapper.results == null);
		System.assert(objCovid19StatisticsWrapper.response == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		Covid19StatisticsWrapper.Deaths objDeaths = new Covid19StatisticsWrapper.Deaths(System.JSON.createParser(json));
		System.assert(objDeaths != null);
		System.assert(objDeaths.new_Z == null);
		System.assert(objDeaths.OneM_pop == null);
		System.assert(objDeaths.total == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		Covid19StatisticsWrapper.Cases objCases = new Covid19StatisticsWrapper.Cases(System.JSON.createParser(json));
		System.assert(objCases != null);
		System.assert(objCases.new_Z == null);
		System.assert(objCases.active == null);
		System.assert(objCases.critical == null);
		System.assert(objCases.recovered == null);
		System.assert(objCases.OneM_pop == null);
		System.assert(objCases.total == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		Covid19StatisticsWrapper.Tests objTests = new Covid19StatisticsWrapper.Tests(System.JSON.createParser(json));
		System.assert(objTests != null);
		System.assert(objTests.OneM_pop == null);
		System.assert(objTests.total == null);
	}
}
