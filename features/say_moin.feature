Feature: Say moin to names in list
    As a user of the software
    In order to be a nice person
    I want to say "moin" to others

    Scenario: one name
        Given a MoinSayer object  # dodgy!  implementation detail...
        When I say "moin" to "bob"
        Then I should see the message "moin bob"

    Scenario: say moin to multiple users
        Given a MoinSayer object
        When I say "moin" to "<user>"
        Then I should see the message "<message>"
        Examples:
            | user  | message    |
            | bob   | moin bob   |
            | alice | moin alice |
            | eve   | moin eve   |

# vim: expandtab shiftwidth=4 softtabstop=4
