@postdemo
Feature: Post API demo

	Background:
		* url 'https://reqres.in/api'
		* header Accept = 'application/json'
		* def expectedOutput = read('response1.json')

	#POST con URL completa
	Scenario: Simple post scenario
		Given url 'https://reqres.in/api/users'
		And request {   "name": "Ivan", "job": "Test Engineer"		}
		When method POST
		Then status 201
		And print response
		
	#POST con parte de la URL, se define la URL general en Background	
	Scenario: post scenario with background	
		Given path '/users'
		And request {   "name": "Jorge", "job": "QA"		}
		When method POST
		Then status 201
		And print response
		
	#POST con aserciones para validar respuesta	
	Scenario: post scenario with assertions	
		Given path '/users'
		And request {   "name": "Jorge", "job": "QA"		}
		When method POST
		Then status 201
		And match response == { "name": "Jorge",	"job": "QA",	"id": "#string",	"createdAt": "#ignore"	}
	  And print response
		
	#POST con aserciones a traves de un archivo json	
	Scenario: post scenario with assertion from a readed file
		Given path '/users'
		And request {   "name": "Jorge", "job": "QA"		}
		When method POST
		Then status 201
		And match response == expectedOutput
	  And print response
	  
	#POST leyendo body request desde un json y con path relativo
	Scenario: post scenario reading body data from file and relative Path
		Given path '/users'
		And def projectPath = karate.properties['user.dir']
		And def filePath = projectPath+'/src/test/java/bodyRequests/request2.json'
		And print filePath
		And def requestBody = read('file:' + filePath) 
		And set requestBody.job = 'Empleo modificado'
		And request requestBody 
		When method POST
		Then status 201
	  And print response 
	
	#POST leyendo body request desde un json y modificando los valores del request  
	Scenario: post reading body data from file and modifying request values
		Given path '/users'
		And def requestBody = read("request1.json")
		And set requestBody.name = 'Jorge Ivan'
		And set requestBody.job = 'Computer systems engineer'
		And request requestBody 
		When method POST
		Then status 201
	  And print response   
	
	Scenario: post to sign up a user
		Given path '/users'
	  And request {   "email": "test@mail.com"		}
		When method POST
		Then status 201
	  And print response   
	  
		