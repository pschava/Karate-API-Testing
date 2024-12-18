Feature: Generate Bearer Token 

	Background: 
	     * configure ssl = true 

	Scenario: Fetch Token Code 

		Given url 'http://localhost:8080/oauth/token' 
		And header Authorization = 'Basic dGVzdHVzZXJpZDp0ZXN0cGFzcw==' 
		And header Content-Type = 'applciation/x-www-form-urlencoded' 
		And request 'grant_type=client_credentials' 
		When method post 
		Then status 200 
		And def accessToken = response.access_token
		And print response.body 
		* def bearerToken = 'Bearer ' + accessToken 
		* print bearerToken 
		* def result = { bearerToken: bearerToken } 
		* karate.set('result',result) 
		* karate.log('result',result)
		
    