Feature: Update Booking

  Background:
    * def body = read("classpath://json//update_booking.json")
    * def responseOfCreateBooking = call read("classpath://feature//CreateBooking.feature")
    * def responseOfCreateToken = call read("classpath://feature//CreateToken.feature")

  Scenario: Verify user can update booking
    Given url 'https://restful-booker.herokuapp.com'
    And path '/booking/' + responseOfCreateBooking.response.bookingid
    And header Content-Type = "application/json"
    And header Accept = "application/json"
    And header Cookie = "token=" + responseOfCreateToken.response.token
    And request body
    When method put
    Then status 200
    And print response