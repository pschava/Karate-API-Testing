Feature: Example API test

Background:
# Define the base URL
* url baseUrl

@Get
  Scenario: Testing a simple GET request
   
   
   # Define the base URL suffix
    Given path 'posts/1'
    When method GET
    Then status 200
    And match response.title == 'sunt aut facere repellat provident occaecati excepturi optio reprehenderit'

@Post
  Scenario: Execute POST request with a JSON body
  	# Define the base URL suffix
    Given path 'posts'
    
    # Request body for PUT request
    And request {"title": "foo","body": "bar","userId": 1}
    
    When method POST
    Then status 201
    * print 'Status Code:', responseStatus
		* print 'Response Headers:', responseHeaders
		* print 'Response Body:', response
    And match response.title == 'foo'
    
    
@Put
  Scenario: Execute Put request with a JSON body
    Given path 'posts/1'
    And request {"id": 1,"title": "updated title 1","body": "updated body","userId": 1}
    When method PUT
    Then status 200
    And match response == 
    """
    {
    "id": 1,
    "title": 
    "updated title 1",
    "body": "updated body",
    "userId": 1
    }
    """
    
    
@Delete
  Scenario: Execute Delete request with a JSON body
    Given path 'posts/1'
    When method DELETE
    Then status 200
    And match response == {}