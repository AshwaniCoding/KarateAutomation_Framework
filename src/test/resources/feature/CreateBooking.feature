Feature: Create booking

  Background:
    * def create_booking_body = read("classpath://json//create_booking.json")
    * def generate_token_body = read("classpath://json//generate_token.json")
    * def update_booking_body = read("classpath://json//update_booking.json")

  Scenario: Verify user can create new booking
    Given url 'https://restful-booker.herokuapp.com'
    And path '/booking'
    And header Content-Type = "application/json"
    And header Accept = "application/json"
    And request create_booking_body
    When method post
    Then status 200
    And print response

  Scenario: Verify user can get booking
    Given url 'https://restful-booker.herokuapp.com'
    And path '/booking/1877'
    And header Accept = "application/json"
    When method get
    Then status 200
    And print response

  Scenario: Verify user can generate token
    Given url 'https://restful-booker.herokuapp.com'
    And path '/auth'
    And header Content-Type = "application/json"
    And header Accept = "application/json"
    And request generate_token_body
    When method post
    Then status 200
    And print response

  Scenario: Verify user can update booking
    Given url 'https://restful-booker.herokuapp.com'
    And path '/booking/1041'
    And header Content-Type = "application/json"
    And header Accept = "application/json"
    And header Cookie = "token=3f88cdbb74556db"
    And request update_booking_body
    When method put
    Then status 200
    And print response

  Scenario: Verify user can delete booking
    Given url 'https://restful-booker.herokuapp.com'
    And path '/booking/1041'
    And header Cookie = "token=3f88cdbb74556db"
    When method delete
    Then status 201