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
public inherited sharing class Covid19CountriesWrapper {
    public class Parameters {
	}

	public String get;
	public List<Parameters> parameters;
	public List<Parameters> errors;
	public Integer results;
	public List<String> response;

	
	public static Covid19CountriesWrapper parse(String json) {
		return (Covid19CountriesWrapper) System.JSON.deserialize(json, Covid19CountriesWrapper.class);
	}
}
