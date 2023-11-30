Feature: config file demo

	Background: 
	* url baseURL

	Scenario: get values from karate config js
		Given print name
	
	@Test		
	Scenario: get config 2
		Given path '/users?page=2'
		When method GET
		Then status 200
		And print response
