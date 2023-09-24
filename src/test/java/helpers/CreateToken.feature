Feature: Create Token

    Scenario: Create Token
        Given url 'https://api.realworld.io/api/'
        Given path 'users/login'
    And request {"user": {"email": "SpencerH1417@gmail.com", "password": "Corncake21"}}
        When method Post
        Then status 200
        * def authToken = response.user.token
