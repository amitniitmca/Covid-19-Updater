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
public inherited sharing class Test_Covid19CountriesWrapper {
    @IsTest
    static void testParse() {
		String json = '{'+
		'    \"get\": \"countries\",'+
		'    \"parameters\": [],'+
		'    \"errors\": [],'+
		'    \"results\": 227,'+
		'    \"response\": ['+
		'        \"Afghanistan\",'+
		'        \"Albania\",'+
		'        \"Algeria\",'+
		'        \"Andorra\",'+
		'        \"Angola\",'+
		'        \"Anguilla\",'+
		'        \"Antigua-and-Barbuda\",'+
		'        \"Argentina\",'+
		'        \"Armenia\",'+
		'        \"Aruba\",'+
		'        \"Australia\",'+
		'        \"Austria\",'+
		'        \"Azerbaijan\",'+
		'        \"Bahamas\",'+
		'        \"Bahrain\",'+
		'        \"Bangladesh\",'+
		'        \"Barbados\",'+
		'        \"Belarus\",'+
		'        \"Belgium\",'+
		'        \"Belize\",'+
		'        \"Benin\",'+
		'        \"Bermuda\",'+
		'        \"Bhutan\",'+
		'        \"Bolivia\",'+
		'        \"Bosnia-and-Herzegovina\",'+
		'        \"Botswana\",'+
		'        \"Brazil\",'+
		'        \"British-Virgin-Islands\",'+
		'        \"Brunei\",'+
		'        \"Bulgaria\",'+
		'        \"Burkina-Faso\",'+
		'        \"Burundi\",'+
		'        \"Cabo-Verde\",'+
		'        \"Cambodia\",'+
		'        \"Cameroon\",'+
		'        \"Canada\",'+
		'        \"CAR\",'+
		'        \"Caribbean-Netherlands\",'+
		'        \"Cayman-Islands\",'+
		'        \"Chad\",'+
		'        \"Channel-Islands\",'+
		'        \"Chile\",'+
		'        \"China\",'+
		'        \"Colombia\",'+
		'        \"Comoros\",'+
		'        \"Congo\",'+
		'        \"Costa-Rica\",'+
		'        \"Croatia\",'+
		'        \"Cuba\",'+
		'        \"Cura&ccedil;ao\",'+
		'        \"Cyprus\",'+
		'        \"Czechia\",'+
		'        \"Denmark\",'+
		'        \"Diamond-Princess\",'+
		'        \"Diamond-Princess-\",'+
		'        \"Djibouti\",'+
		'        \"Dominica\",'+
		'        \"Dominican-Republic\",'+
		'        \"DRC\",'+
		'        \"Ecuador\",'+
		'        \"Egypt\",'+
		'        \"El-Salvador\",'+
		'        \"Equatorial-Guinea\",'+
		'        \"Eritrea\",'+
		'        \"Estonia\",'+
		'        \"Eswatini\",'+
		'        \"Ethiopia\",'+
		'        \"Faeroe-Islands\",'+
		'        \"Falkland-Islands\",'+
		'        \"Fiji\",'+
		'        \"Finland\",'+
		'        \"France\",'+
		'        \"French-Guiana\",'+
		'        \"French-Polynesia\",'+
		'        \"Gabon\",'+
		'        \"Gambia\",'+
		'        \"Georgia\",'+
		'        \"Germany\",'+
		'        \"Ghana\",'+
		'        \"Gibraltar\",'+
		'        \"Greece\",'+
		'        \"Greenland\",'+
		'        \"Grenada\",'+
		'        \"Guadeloupe\",'+
		'        \"Guam\",'+
		'        \"Guatemala\",'+
		'        \"Guinea\",'+
		'        \"Guinea-Bissau\",'+
		'        \"Guyana\",'+
		'        \"Haiti\",'+
		'        \"Honduras\",'+
		'        \"Hong-Kong\",'+
		'        \"Hungary\",'+
		'        \"Iceland\",'+
		'        \"India\",'+
		'        \"Indonesia\",'+
		'        \"Iran\",'+
		'        \"Iraq\",'+
		'        \"Ireland\",'+
		'        \"Isle-of-Man\",'+
		'        \"Israel\",'+
		'        \"Italy\",'+
		'        \"Ivory-Coast\",'+
		'        \"Jamaica\",'+
		'        \"Japan\",'+
		'        \"Jordan\",'+
		'        \"Kazakhstan\",'+
		'        \"Kenya\",'+
		'        \"Kuwait\",'+
		'        \"Kyrgyzstan\",'+
		'        \"Laos\",'+
		'        \"Latvia\",'+
		'        \"Lebanon\",'+
		'        \"Lesotho\",'+
		'        \"Liberia\",'+
		'        \"Libya\",'+
		'        \"Liechtenstein\",'+
		'        \"Lithuania\",'+
		'        \"Luxembourg\",'+
		'        \"Macao\",'+
		'        \"Madagascar\",'+
		'        \"Malawi\",'+
		'        \"Malaysia\",'+
		'        \"Maldives\",'+
		'        \"Mali\",'+
		'        \"Malta\",'+
		'        \"Marshall-Islands\",'+
		'        \"Martinique\",'+
		'        \"Mauritania\",'+
		'        \"Mauritius\",'+
		'        \"Mayotte\",'+
		'        \"Mexico\",'+
		'        \"Micronesia\",'+
		'        \"Moldova\",'+
		'        \"Monaco\",'+
		'        \"Mongolia\",'+
		'        \"Montenegro\",'+
		'        \"Montserrat\",'+
		'        \"Morocco\",'+
		'        \"Mozambique\",'+
		'        \"MS-Zaandam\",'+
		'        \"MS-Zaandam-\",'+
		'        \"Myanmar\",'+
		'        \"Namibia\",'+
		'        \"Nepal\",'+
		'        \"Netherlands\",'+
		'        \"New-Caledonia\",'+
		'        \"New-Zealand\",'+
		'        \"Nicaragua\",'+
		'        \"Niger\",'+
		'        \"Nigeria\",'+
		'        \"North-Macedonia\",'+
		'        \"Norway\",'+
		'        \"Oman\",'+
		'        \"Pakistan\",'+
		'        \"Palestine\",'+
		'        \"Panama\",'+
		'        \"Papua-New-Guinea\",'+
		'        \"Paraguay\",'+
		'        \"Peru\",'+
		'        \"Philippines\",'+
		'        \"Poland\",'+
		'        \"Portugal\",'+
		'        \"Puerto-Rico\",'+
		'        \"Qatar\",'+
		'        \"R&eacute;union\",'+
		'        \"Romania\",'+
		'        \"Russia\",'+
		'        \"Rwanda\",'+
		'        \"S-Korea\",'+
		'        \"Saint-Helena\",'+
		'        \"Saint-Kitts-and-Nevis\",'+
		'        \"Saint-Lucia\",'+
		'        \"Saint-Martin\",'+
		'        \"Saint-Pierre-Miquelon\",'+
		'        \"Samoa\",'+
		'        \"San-Marino\",'+
		'        \"Sao-Tome-and-Principe\",'+
		'        \"Saudi-Arabia\",'+
		'        \"Senegal\",'+
		'        \"Serbia\",'+
		'        \"Seychelles\",'+
		'        \"Sierra-Leone\",'+
		'        \"Singapore\",'+
		'        \"Sint-Maarten\",'+
		'        \"Slovakia\",'+
		'        \"Slovenia\",'+
		'        \"Solomon-Islands\",'+
		'        \"Somalia\",'+
		'        \"South-Africa\",'+
		'        \"South-Sudan\",'+
		'        \"Spain\",'+
		'        \"Sri-Lanka\",'+
		'        \"St-Barth\",'+
		'        \"St-Vincent-Grenadines\",'+
		'        \"Sudan\",'+
		'        \"Suriname\",'+
		'        \"Sweden\",'+
		'        \"Switzerland\",'+
		'        \"Syria\",'+
		'        \"Taiwan\",'+
		'        \"Tajikistan\",'+
		'        \"Tanzania\",'+
		'        \"Thailand\",'+
		'        \"Timor-Leste\",'+
		'        \"Togo\",'+
		'        \"Trinidad-and-Tobago\",'+
		'        \"Tunisia\",'+
		'        \"Turkey\",'+
		'        \"Turks-and-Caicos\",'+
		'        \"UAE\",'+
		'        \"Uganda\",'+
		'        \"UK\",'+
		'        \"Ukraine\",'+
		'        \"Uruguay\",'+
		'        \"US-Virgin-Islands\",'+
		'        \"USA\",'+
		'        \"Uzbekistan\",'+
		'        \"Vanuatu\",'+
		'        \"Vatican-City\",'+
		'        \"Venezuela\",'+
		'        \"Vietnam\",'+
		'        \"Wallis-and-Futuna\",'+
		'        \"Western-Sahara\",'+
		'        \"Yemen\",'+
		'        \"Zambia\",'+
		'        \"Zimbabwe\"'+
		'    ]'+
		'}';
		Covid19CountriesWrapper obj = Covid19CountriesWrapper.parse(json);
		System.assert(obj != null);
	}
}
