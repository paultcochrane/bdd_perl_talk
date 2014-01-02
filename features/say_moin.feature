Feature: Say moin to names in list
    As a user of the software
    In order to be a nice person
    I want to say "moin" to others

    Scenario: one name
	Given the name "bob"
	When I say moin
	Then I should see "moin bob"
