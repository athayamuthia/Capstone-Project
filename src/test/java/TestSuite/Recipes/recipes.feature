Feature: Recipes

  Background:
    * url 'https://api.spoonacular.com/recipes/'
    * def apiKey = '80b34efb605445359b723790a089223f'
    * def username = 'athayamuthia'
    * def hash = '183ee8e74ce80cb8a9e46f4748aa8f5eebdc01e0'

  @test1
  Scenario: Search Recipes
    Given path 'complexSearch'
    And header Content-type = 'application/json'
    And param apiKey = apiKey
    And param Query = 'pasta'
    And param maxFat = '25'
    And param number = '2'
    When method GET
    Then status 200
    And print 'Response:', response
    And match response.results[*].id contains 782585
    * def searchResponse = response
    * def id1 = searchResponse.results[0].id

    @test2
  Scenario: Get Recipe Information
      * def id2 = call read('recipes.feature@test1')
      * def id = id2.searchResponse.results[0].id
    Given path id, 'information'
    And header Content-type = 'application/json'
    And param apiKey = apiKey
    And param includeNutrition = 'false'
    When method GET
    Then status 200
    And print 'Response:', response

  Scenario: Get Similar Recipes
    * def id2 = call read('recipes.feature@test1')
    * def id = id2.searchResponse.results[0].id
    Given path id, 'similar'
    And header Content-type = 'application/json'
    And param apiKey = apiKey
    When method GET
    Then status 200
    And print 'Response:', response

  Scenario: Taste by ID
    * def id2 = call read('recipes.feature@test1')
    * def id = id2.searchResponse.results[0].id
    Given path id, 'tasteWidget.json'
    And header Content-type = 'application/json'
    And param apiKey = apiKey
    And param normalize = 'false'
    When method GET
    Then status 200
    And print 'Response:', response

  Scenario: Guess Nutrition by Dish Name
    Given path 'guessNutrition'
    And header Content-type = 'application/json'
    And param apiKey = apiKey
    And param title = 'cheese burger'
    When method GET
    Then status 200
    And print 'Response:', response