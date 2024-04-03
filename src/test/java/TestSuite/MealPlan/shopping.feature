Feature: Shopping

  Background:
    * url 'https://api.spoonacular.com/mealplanner/'
    * def apiKey = '80b34efb605445359b723790a089223f'
    * def username = 'athayamuthia'
    * def hash = '183ee8e74ce80cb8a9e46f4748aa8f5eebdc01e0'
    * def startDate = '2024-04-03'
    * def endDate = '2024-04-03'

  Scenario: Get Shopping List
    Given path username,'shopping-list'
    And header Content-type = 'application/json'
    And param apiKey = apiKey
    And param hash = hash
    When method GET
    Then status 200
    And print 'Response :', response

  Scenario: Add to Shopping List
    Given path username,'shopping-list','items'
    And header Content-type = 'application/json'
    And param apiKey = apiKey
    And param hash = hash
    And request
    """
    {
      "item": "1 package baking powder",
      "aisle": "Baking",
      "parse": true
    }
    """
    When method POST
    Then status 200
    * match response.aisle == 'Baking'
    And print 'Response :', response

  Scenario: Generate Shopping List
    Given path username,'shopping-list',startDate,endDate
    And header Content-type = 'application/json'
    And param apiKey = apiKey
    And param hash = hash
    And request
    """
    {
    "aisles": [
        {
            "aisle": "Baking",
            "items": [
                {
                    "id": 4496408,
                    "name": "baking powder",
                    "measures": {
                        "original": {
                            "amount": 1.0,
                            "unit": "package"
                        },
                        "metric": {
                            "amount": 1.0,
                            "unit": "pkg"
                        },
                        "us": {
                            "amount": 1.0,
                            "unit": "pkg"
                        }
                    },
                    "pantryItem": false,
                    "aisle": "Baking",
                    "cost": 0.71,
                    "ingredientId": 18369
                }
            ]
        }
    ],
    "cost": 0.71,
    "startDate": 1712129120,
    "endDate": 1712129120
}
    """
    When method POST
    Then status 200
    * match response.aisles[0].aisle == 'Produce'
    And print 'Response :', response

  Scenario: Delete from Shopping List
    Given path username,'shopping-list','items',4496470
    And header Content-type = 'application/json'
    And param apiKey = apiKey
    And param hash = hash
    When method DELETE
    Then status 200
    And print 'Response:', response