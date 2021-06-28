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
public inherited sharing class Covid19StatisticsWrapper {
    public class Response {
		public String continent {get;set;} 
		public String country {get;set;} 
		public Integer population {get;set;} 
		public Cases cases {get;set;} 
		public Deaths deaths {get;set;} 
		public Tests tests {get;set;} 
		public String day {get;set;} 
		public String time_Z {get;set;} // in json: time

		public Response(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'continent') {
							continent = parser.getText();
						} else if (text == 'country') {
							country = parser.getText();
						} else if (text == 'population') {
							population = parser.getIntegerValue();
						} else if (text == 'cases') {
							cases = new Cases(parser);
						} else if (text == 'deaths') {
							deaths = new Deaths(parser);
						} else if (text == 'tests') {
							tests = new Tests(parser);
						} else if (text == 'day') {
							day = parser.getText();
						} else if (text == 'time') {
							time_Z = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Response consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Errors {

		public Errors(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						{
							System.debug(LoggingLevel.WARN, 'Errors consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Parameters {
		public String country {get;set;} 

		public Parameters(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'country') {
							country = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Parameters consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public String get {get;set;} 
	public Parameters parameters {get;set;} 
	public List<Errors> errors {get;set;} 
	public Integer results {get;set;} 
	public List<Response> response {get;set;} 

	public Covid19StatisticsWrapper(JSONParser parser) {
		while (parser.nextToken() != System.JSONToken.END_OBJECT) {
			if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
				String text = parser.getText();
				if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
					if (text == 'get') {
						get = parser.getText();
					} else if (text == 'parameters') {
						parameters = new Parameters(parser);
					} else if (text == 'errors') {
						errors = arrayOfErrors(parser);
					} else if (text == 'results') {
						results = parser.getIntegerValue();
					} else if (text == 'response') {
						response = arrayOfResponse(parser);
					} else {
						System.debug(LoggingLevel.WARN, 'Covid19StatisticsWrapper consuming unrecognized property: '+text);
						consumeObject(parser);
					}
				}
			}
		}
	}
	
	public class Deaths {
		public String new_Z {get;set;} // in json: new
		public String OneM_pop {get;set;} 
		public Integer total {get;set;} 

		public Deaths(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'new') {
							new_Z = parser.getText();
						} else if (text == '1M_pop') {
							OneM_pop = parser.getText();
						} else if (text == 'total') {
							total = parser.getIntegerValue();
						} else {
							System.debug(LoggingLevel.WARN, 'Deaths consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Cases {
		public String new_Z {get;set;} // in json: new
		public Integer active {get;set;} 
		public Integer critical {get;set;} 
		public Integer recovered {get;set;} 
		public String OneM_pop {get;set;} 
		public Integer total {get;set;} 

		public Cases(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'new') {
							new_Z = parser.getText();
						} else if (text == 'active') {
							active = parser.getIntegerValue();
						} else if (text == 'critical') {
							critical = parser.getIntegerValue();
						} else if (text == 'recovered') {
							recovered = parser.getIntegerValue();
						} else if (text == '1M_pop') {
							OneM_pop = parser.getText();
						} else if (text == 'total') {
							total = parser.getIntegerValue();
						} else {
							System.debug(LoggingLevel.WARN, 'Cases consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Tests {
		public String OneM_pop {get;set;} 
		public Integer total {get;set;} 

		public Tests(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == '1M_pop') {
							OneM_pop = parser.getText();
						} else if (text == 'total') {
							total = parser.getIntegerValue();
						} else {
							System.debug(LoggingLevel.WARN, 'Tests consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
		
	public static Covid19StatisticsWrapper parse(String json) {
		System.JSONParser parser = System.JSON.createParser(json);
		return new Covid19StatisticsWrapper(parser);
	}
	
	public static void consumeObject(System.JSONParser parser) {
		Integer depth = 0;
		do {
			System.JSONToken curr = parser.getCurrentToken();
			if (curr == System.JSONToken.START_OBJECT || 
				curr == System.JSONToken.START_ARRAY) {
				depth++;
			} else if (curr == System.JSONToken.END_OBJECT ||
				curr == System.JSONToken.END_ARRAY) {
				depth--;
			}
		} while (depth > 0 && parser.nextToken() != null);
	}
	
    private static List<Response> arrayOfResponse(System.JSONParser p) {
        List<Response> res = new List<Response>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Response(p));
        }
        return res;
    }

    private static List<Errors> arrayOfErrors(System.JSONParser p) {
        List<Errors> res = new List<Errors>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Errors(p));
        }
        return res;
    }
}
