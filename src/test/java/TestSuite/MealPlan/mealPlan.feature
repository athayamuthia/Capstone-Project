Feature: Test Meal Plan

  Background:
    * url 'https://api.spoonacular.com/mealplanner/'
    * def apiKey = '80b34efb605445359b723790a089223f'
    * def username = 'athayamuthia'
    * def hash = '183ee8e74ce80cb8a9e46f4748aa8f5eebdc01e0'
    * def startDate = '2024-03-27'
#    * def password --> basic Auth
#    * grant_type --> Oauth 2.0
#    * client_id --> Oauth 2.0/Bearer Token
#    * client_secret --> Oauth 2.0/Bearer Token

#  Code untuk Authorization
#    And header Authorization = 'bearer' + Token

#  Code basic Auth
#    And auth username, password

  Scenario: Test Generate Meal Plan
    Given path 'generate'
    And param apiKey = apiKey
    When method GET
    Then status 200
    And print 'Response :', response

  Scenario: Add to Meal Plan
    Given path username, 'items'
    And header Content-type = 'application/json'
    And param apiKey = apiKey
    And param hash = hash
    And request
    """
    {
      "date": 1589500800,
      "slot": 1,
      "position": 0,
      "type": "INGREDIENTS",
      "value": {
          "ingredients": [
              {
                  "name": "1 banana"
              }
          ]
      }
    }
    """
    When method POST
    Then status 200
    And match response.status == 'success'

  Scenario: Get Meal Plan Week
    Given path username, 'week', startDate
    And param apiKey = apiKey
    And param hash = hash
    When method GET
    Then status 200
    And print 'Response:', response

  Scenario: Delete from Meal Plan
    Given path username, 'items', '25627602'
    And param apiKey = apiKey
    And param hash = hash
    When method DELETE
    Then status 200
    And print response.status == 'success'