Feature: Delete Booking

  Background:
    * def responseOfCreateBooking = call read("classpath://feature//CreateBooking.feature")
    * def responseOfCreateToken = call read("classpath://feature//CreateToken.feature")

  Scenario: Verify user can delete booking
    Given url 'https://restful-booker.herokuapp.com'
    And path '/booking/' + responseOfCreateBooking.response.bookingid
    And header Cookie = "token=" + responseOfCreateToken.response.token
    When method delete
    Then status 201