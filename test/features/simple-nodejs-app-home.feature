Feature: Basic application
  In order to verify that application is installed and configured correctly
  As an anonymous user
  I want to see a basic application functionality

        Scenario: Display app's index page
            Given application started
             When I visit the '/' url
             Then I see application's home page

        Scenario: Display application healthcheck url
            Given application started
             When I visit the '/health' url
             Then I see application's uptime

        Scenario: Display application version url
            Given application started
             When I visit the '/version' url
             Then I see application product and assembly versions

        Scenario: Display application build information
            Given application started
             When I visit the '/buildinfo' url
             Then I see build information

        Scenario: Display application error page
            Given application started
             When I visit the '/some-wrong-url' url
             Then I see 404 error page with common html theme

        Scenario: Display cpu stats
            Given application started
             When I visit the '/stats/cpu' url
             Then I see cpu info

        Scenario: Display mem stats
            Given application started
             When I visit the '/stats/mem' url
             Then I see memory info

        Scenario: Run some hard-cpu job
            Given application started
             When I visit the '/do-hard' url
             Then I see calculated results

        Scenario: Run error-generating url
            Given application started
             When I visit the '/gen-error500' url
             Then I see 500 error
