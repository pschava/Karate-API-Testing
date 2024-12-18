

Feature: Validate authentication feature 

	Background: 
			 * url baseUrl
	     * configure ssl = true 
	     * def configTestBase = karate.callSingle('classpath:com/example/GenerateBearerToken.feature') 
       * def bearerToken = configTestBase.bearerToken 

	Scenario: Fetch Token Code 
	  Give path 'validateToken' 
	  And header Authorization = bearerToken
	  And header content-Type = 'application/json' 
	  When method get 
	  Then status 200
	  * print response