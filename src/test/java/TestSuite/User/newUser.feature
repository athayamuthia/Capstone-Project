Feature: User Management

  Background:
    # Assume the user is already logged in and has a valid token
    Given url 'https://petstore.swagger.io/v2/user/login'
    And request { username: 'muthia', password: 'abc12345' }
    When method GET
    Then status 200
    And def authToken = response.token

  Scenario: Create a new user
    Given url 'https://petstore.swagger.io/v2/user'
    And header Authorization = 'Bearer ' + authToken
    And request
    """
    {
      "id": 1,
      "username": "muthiaaaaa",
      "firstName": "Muthia",
      "lastName": "Athaya",
      "email": "muthia@email.com",
      "password": "abc12345",
      "phone": "909090909090",
      "userStatus": 1
    }
    """
    When method POST
    Then status 200