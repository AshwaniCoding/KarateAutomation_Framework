Feature: Get Booking

  Background:
    * def responseOfCreateBooking = call read("classpath://feature//CreateBooking.feature")

  Scenario: Verify user can get booking
    Given url 'https://restful-booker.herokuapp.com'
    And path '/booking/' + responseOfCreateBooking.response.bookingid
    And header Accept = "application/json"
    When method get
    Then status 200
    And print response
