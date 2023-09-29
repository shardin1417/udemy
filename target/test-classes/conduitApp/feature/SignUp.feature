@parallel=false
Feature: Sign Up new user

Background:
    * def dataGenerator = Java.type('helpers.DataGenerator')
    * url 'https://api.realworld.io/api/'
    * def randomEmail = dataGenerator.getRandomEmail()
    * def randomUsername = dataGenerator.getRandomUsername()
Scenario: New user Sign Up

    Given path 'users'
    And request 
    """
        {
        "user": {
            "email": "#(randomEmail)", 
            "password": "signupdemotwo",
            "username": "#(randomUsername)"
        }
        }
    """
    When method Post
    Then status 201
    And match response == 
    """
        {
    "user": {
        "email": "#string",
        "username": "#string",
        "bio": null,
        "image": "#string",
        "token": "#string"
    }
}
    """

Scenario Outline: Validate Sign up error messages

    Given path 'users'
    And request 
    """
        {
        "user": {
            "email": "<email>", 
            "password": "<password>",
            "username": "<username>"
        }
        }
    """
    When method Post
    And match response == <errorResponse>

    Examples: 
        | email                   | password      | username                  | errorResponse                                                                       |
        | #(randomEmail)          | signupdemotwo | signupdemotwo             | {"errors":{"username":["has already been taken"]}}                                  |
        | signupdemotwo@gmail.com | signupdemotwo | #(randomUsername)         | {"errors":{"email":["has already been taken"]}}                                     |
        | SpencerH1417@gmail.com  | signupdemotwo | #(randomUsername)         | {"errors":{"email":["has already been taken"]}}                                     |
        | #(randomEmail)          | signupdemotwo | signupdemotwotwotwotwoasf | {"errors":{"username":["has already been taken"]}}                                  |
        |                         | signupdemotwo | #(randomUsername)         | {"errors":{"email":["can't be blank"]}}                                             |
        |#(randomEmail)           |               | #(randomUsername)         | {"errors":{"password":["can't be blank"]}}                                          |
        |#(randomEmail)           | signupdemotwo |                           | {"errors":{"username":["can't be blank"]}}                                          |