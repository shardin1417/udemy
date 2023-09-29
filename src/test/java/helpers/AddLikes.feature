Feature: Add likes

Background: 
    * url 'https://api.realworld.io/api/'

Scenario: add likes
    Given path 'articles', slug, 'favorite'
    And request {}
    When method Post
    Then status 200
    * def likesCount = response.article.favoritesCount