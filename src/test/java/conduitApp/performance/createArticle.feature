
Feature: Articles

    Background: Define URL
        Given url 'https://api.realworld.io/api/'
        * def articleRequestBody = read('classpath:conduitApp/json/newArticleRequest.json')
        * def dataGenerator = Java.type('helpers.DataGenerator')
        * set articleRequestBody.article.title = dataGenerator.getRandomArticleValues().title
        * set articleRequestBody.article.description = dataGenerator.getRandomArticleValues().description
        * set articleRequestBody.article.body = dataGenerator.getRandomArticleValues().body
        * def tokenResponse = callonce read('classpath:helpers/CreateToken.feature') {"email": "SpencerH1417@gmail.com","password": "Corncake21"}
        * def token = tokenResponse.authToken

        * def sleep = function(ms){ java.lang.Thread.sleep(ms)}
        * def pause = karate.get('__gatling.pause', sleep)

    Scenario: Create and delete article
        Given header Authorization = 'Token ' + token
        Given path 'articles'
        And request articleRequestBody
        Given header Authorization = 'Token ' + token
        When method Post
        Then status 201
        * def articleId = response.article.slug

        # * pause(5000)

        Given header Authorization = 'Token ' + token
        Given path 'articles',articleId
        When method Delete
        Then status 204


