@parallel=false
Feature: Articles

    Background: Define URL
        Given url apiUrl
        * def articleRequestBody = read('classpath:conduitApp/json/newArticleRequest.json')
        * def dataGenerator = Java.type('helpers.DataGenerator')
        * set articleRequestBody.article.title = dataGenerator.getRandomArticleValues().title
        * set articleRequestBody.article.description = dataGenerator.getRandomArticleValues().description
        * set articleRequestBody.article.body = dataGenerator.getRandomArticleValues().body
        * def tokenResponse = callonce read('classpath:helpers/CreateToken.feature') {"email": "SpencerH1417@gmail.com","password": "Corncake21"}
        * def token = tokenResponse.authToken

    Scenario: Create a new article
        Given header Authorization = 'Token ' + token
        Given path 'articles'
        And request articleRequestBody
        When method Post
        Then status 201
        And match response.article.title == articleRequestBody.article.title

    Scenario: Create and delete article
        Given header Authorization = 'Token ' + token
        Given path 'articles'
        And request articleRequestBody
        When method Post
        Then status 201
        * def articleId = response.article.slug

        Given header Authorization = 'Token ' + token
        Given params { limit: 10, offset: 0 }
        Given path 'articles'
        When method Get
        Then status 200
        And match response.articles[0].title == articleRequestBody.article.title

        Given header Authorization = 'Token ' + token
        Given path 'articles',articleId
        When method Delete
        Then status 204

        Given params { limit: 10, offset: 0 }
        Given path 'articles'
        When method Get
        Then status 200
        And match response.articles[0].title != articleRequestBody.article.title


