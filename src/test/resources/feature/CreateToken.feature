Feature: Generate Token

  Background:
    * def body = read("classpath://json//generate_token.json")

  Scenario: Verify user can generate token
    Given url 'https://restful-booker.herokuapp.com'
    And path '/auth'
    And header Content-Type = "application/json"
    And header Accept = "application/json"
    And request body
    When method post
    Then status 200
    And print response