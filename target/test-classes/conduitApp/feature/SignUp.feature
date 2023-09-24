Feature: Sign Up new user

Background:
    * def dataGenerator = Java.type('helpers.DataGenerator')
    * def userData = {"email":"KarateUser3@test.com", "username":"KarateUser32"}
    * url 'https://api.realworld.io/api/'

Scenario: New user Sign Up
    Given path 'users'
    And request 
    """
        {
        "user": {
            "email": "#(userData.email)", 
            "password": "signupdemotwo",
            "username": "#(userData.username)"
        }
        }
    """
    When method Post
    Then status 201
