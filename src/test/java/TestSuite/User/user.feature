Feature:user module

  Background:
#    global variable
    * url baseURL
    * def username = 'Muthia90'
    * def password = 'abc12345'

  Scenario: Create users with a list
    Given path createListURL
    And request
    """
    [
      {
        "id": 8798,
        "username": "#(username)",
        "firstName": "Muthia1",
        "lastName": "Athaya1",
        "email": "muthia@email.com",
        "password": "#(password)",
        "phone": "808080808",
        "userStatus": 1
      }
    ]
    """
    When method post
    Then print response
    And status 200
    * karate.set('username', username)
    * karate.set('password', password)

  Scenario: Get user by username
    Given path 'user/', username
    When method GET
    Then status 200

  Scenario: Login with username and password
    Given path 'user/login'
    And param username = username
    And param password = password
    When method GET
    Then print response
    And status 200

  Scenario: Put user by username
    Given path 'user/', username
    And request
    """
    {
      "id": 9999,
      "username": "Muthia2",
      "firstName": "muthiaa",
      "lastName": "athayaa",
      "email": "muthia@email.com",
      "password": "abc12345678",
      "phone": "909090909090",
      "userStatus": 1
    }
    """
    When method PUT
    Then print response
    And status 200
    * def responseUsername = response.username
    * def responsePassword = response.password

  Scenario: delete user by username
    Given path 'user/', 'Muthia2'
    When method DELETE
    Then print response
    And status 200

  Scenario: logout
    Given path 'user/logout'
    When method GET
    Then print response
    And status 200





