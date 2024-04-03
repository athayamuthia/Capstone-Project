Feature: Misc

  Background:
    * url 'https://api.spoonacular.com/food/'
    * def apiKey = '80b34efb605445359b723790a089223f'
    * def username = 'athayamuthia'
    * def hash = '183ee8e74ce80cb8a9e46f4748aa8f5eebdc01e0'

  Scenario: Random Food Joke
    Given path 'jokes/random'
    And header Content-type = 'application/json'
    And param apiKey = apiKey
    When method GET
    Then status 200
    And print 'Response:', response

  Scenario: Detect Food in Text
    Given path 'detect'
    And header Content-type = 'application/x-www-form-urlencoded'
    And param apiKey = apiKey
    And param text = 'needdd pizzaaa'
    When method POST
    Then status 200
    And print 'Response:', response

  Scenario: Image Analysis by URL
    Given path 'images/analyze'
    And header Content-type = 'application/json'
    And param apiKey = apiKey
    And param imageUrl = 'https://images.immediate.co.uk/production/volatile/sites/30/2017/01/Bunch-of-bananas-67e91d5.jpg?quality=90&resize=440,400'
    When method GET
    Then status 200
    And print 'Response:', response