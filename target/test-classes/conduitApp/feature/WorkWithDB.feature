
Feature: work with DB

    Background: connect to db
        * def dbHandler = Java.type('helpers.DbHandler')

    Scenario: Seed database with a new Job 1
        * eval dbHandler.addNewJobWithName("QA2")

    Scenario: Seed database with a new Job 2
        * eval dbHandler.addNewJobWithName("SDET")

    Scenario: Seed database with a new Job 3
        * eval dbHandler.addNewJobWithName("SDE")

    Scenario: Seed database with a new Job 4
        * eval dbHandler.addNewJobWithName("Data Science Worker")

    Scenario: Seed database with a new Job 5
        * eval dbHandler.addNewJobWithName("Data Analyst")

    Scenario: Seed database with a new Store
        * eval dbHandler.addNewStoreAndLocation("Target","9235 Poplar Ave", "Germantown", "TN", 38138)

    Scenario: Get level for Job #1
        * def level = dbHandler.getMinAndMaxLevelsForJob("QA2")
        And match level.minLvl == '50'
        And match level.maxLvl == '100'

    Scenario: Get level for Job #2
        * def level = dbHandler.getMinAndMaxLevelsForJob("Editor")
        And match level.minLvl == '25'
        And match level.maxLvl == '100'

    Scenario: Get level for Job #3
        * def level = dbHandler.getMinAndMaxLevelsForJob("Designer")
        And match level.minLvl == '25'
        And match level.maxLvl == '100'

    Scenario: Get level for Job #4
        * def level = dbHandler.getMinAndMaxLevelsForJob("Operations Manager")
        And match level.minLvl == '75'
        And match level.maxLvl == '150'

    Scenario: Get level for Job #5
        * def level = dbHandler.getMinAndMaxLevelsForJob("Productions Manager")
        And match level.minLvl == '75'
        And match level.maxLvl == '165'

    Scenario: Get location from store name 1
        * def store = dbHandler.getStoreAndLocation("Eric the Read Books")
        And match store.stor_address == '788 Catamaugus Ave.'
        And match store.city == 'Seattle'
        And match store.state == 'WA'
        And match store.zip == 98056

    Scenario: Get location from store name 2
        * def store = dbHandler.getStoreAndLocation("Barnum's")
        And match store.stor_address == '567 Pasadena Ave.'
        And match store.city == 'Tustin'
        And match store.state == 'CA'
        And match store.zip == 92789

    Scenario: Get location from store name 3
        * def store = dbHandler.getStoreAndLocation("News & Brews")
        And match store.stor_address == '577 First St.'
        And match store.city == 'Los Gatos'
        And match store.state == 'CA'
        And match store.zip == 96745   

    Scenario: Get location from store name 4
        * def store = dbHandler.getStoreAndLocation("Doc-U-Mat: Quality Laundry and Books")
        And match store.stor_address == '24-A Avogadro Way'
        And match store.city == 'Remulade'
        And match store.state == 'WA'
        And match store.zip == 98014

    Scenario: Get location from store name 5
        * def store = dbHandler.getStoreAndLocation("Fricative Bookshop")
        And match store.stor_address == '577 First St.'
        And match store.city == 'Fremont'
        And match store.state == 'CA'
        And match store.zip == 90019

    Scenario: Get location from store name 6
        * def store = dbHandler.getStoreAndLocation("Bookbeat")
        And match store.stor_address == '679 Carson St.'
        And match store.city == 'Portland'
        And match store.state == 'OR'
        And match store.zip == 89076
    Scenario: Get full name from author id #1
        * def author = dbHandler.getFullNameFromAuthorId("172-32-1176")
        And match author.au_lname == "White"
        And match author.au_fname == "Johnson"

    Scenario: Get full name from author id #2
        * def author = dbHandler.getFullNameFromAuthorId("213-46-8915")
        And match author.au_lname == "Green"
        And match author.au_fname == "Marjorie"

    Scenario: Get full name from author id #3
        * def author = dbHandler.getFullNameFromAuthorId("238-95-7766")
        And match author.au_lname == "Carson"
        And match author.au_fname == "Cheryl"

    Scenario: Get full name from author id #4
        * def author = dbHandler.getFullNameFromAuthorId("267-41-2394")
        And match author.au_lname == "O'Leary"
        And match author.au_fname == "Michael"

    Scenario: Get full name from author id #5
        * def author = dbHandler.getFullNameFromAuthorId("274-80-9391")
        And match author.au_lname == "Straight"
        And match author.au_fname == "Dean"

