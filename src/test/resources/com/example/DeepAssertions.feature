Feature: Advanced deep JSON assertion validation in Karate

  Scenario: Validate data types, non-null values, and booleans in JSON response

    Given url 'https://reqres.in/api/users/2'
    When method get
    Then status 200

    # Validate that the 'data' object exists and its fields are of correct types
    And match response.data.id == '#number'  # Assert that 'id' is a number
    And match response.data.email == '#string'  # Assert that 'email' is a string
    And match response.data.first_name == '#string'  # Assert 'first_name' is a string
    And match response.data.last_name == '#string'  # Assert 'last_name' is a string
    And match response.data.avatar == '#string'  # Assert 'avatar' is a string (URL)
   

    # Check if 'data' is not null or empty
    And match response.data != null  # Assert that 'data' is not null
    And match response.data.email != null  # Assert 'email' is not null
    And match response.data.first_name != null  # Assert 'first_name' is not null


    # Validate a Boolean field at two levels in the JSON response
    And match response.support.text == '#string'  # Assert that 'support.text' is a string
    And match response.support.url == '#string'  # Assert that 'support.url' is a string

    # Nested Boolean validation (Assuming we want to validate a Boolean at the 'support' level)
    # Here, assume we check for some kind of 'isActive' or similar boolean field
    # (Note: 'reqres' API doesn't directly return booleans, but let's simulate this)
    Given url 'https://reqres.in/api/users/3'  # Example where we might have more complex fields
    When method get
    Then status 200
    And match response.data.is_active == '#boolean'  # Checking for a boolean value

    # Two-layer deep JSON child validation:
    And match response.data.id == 3  # First layer: Validate 'id' field
    And match response.data.first_name == 'Emma'  # First layer: Validate 'first_name'

    And match response.data.company.name == 'Verizon'  # Second layer: Nested field
    And match response.data.company.address.city == 'Houston'  # Second layer: Nested field validation
    
    
    
    