function fn(){
	
	//Definición de Variables globales
	var config ={
		name : "Ivan",
		baseURL: "https://reqres.in/api"
	};	
	
	//Definición de variable del entorno
	//mvn test -Dkarate.env=ENTORNO <- Para ejecutar desde terminal e indicar el entorno
	var enviroment = karate.env
	karate.log('The value of enviroment is :', enviroment)
	
	if(enviroment == 'qa'){
		config.baseURL = 'https://reqres.in/api/QA'
	}
	else if(enviroment == 'dev'){
		config.baseURL = 'https://reqres.in/api/DEV'
	}else{
		config.baseURL = 'https://reqres.in/api/default'
	}
	//Se define los tiempos de timeout y espera
	karate.configure('connectTimeout', 5000)
	karate.configure('readTimeout', 5000)
	
	return config
}