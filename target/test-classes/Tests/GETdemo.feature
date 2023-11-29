@getdemo
Feature: Sample api Test

	Background:
	* url 'https://reqres.in/api'
	* header Accept = 'application/json'
	
	#GET con URL completa
	Scenario: Test a sample Get API with full URL
		Given url 'https://reqres.in/api/users?page=2'
		When method GET
		Then status 200
		And print response
		And print responseStatus
		And print responseTime
		And print responseHeaders
	
	#GET con parte de la URL, se define la URL general en Background
	Scenario: Test a sample Get API with a Path
		Given path '/users?page=2'
		When method GET
		Then status 200
		And print response
	
	#GET con parte de la URL y parametros
	Scenario: Test a sample Get API with a Path and parameters
		Given path '/users'
		And param page = 2
		When method GET
		Then status 200
		And print response
	
	#GET con aserciones para validar respuesta, $ == response (Usar json Path finder)
	Scenario: Test a sample Get API with assertions
		Given path '/users'
		And param page = 2
		When method GET
		Then status 200
		And print response
		And match response.data[0].first_name != null
		And assert response.data.length == 6
		And match $.data[1].id == 8
		And match $.data[3].last_name == 'Fields'