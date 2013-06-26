// demo module
this.title = "Welcome to your webservice!";
this.name = "HPI api module";
this.version = "0.1.0";
this.endpoint = "http://localhost:8080";

var reg1 = {
	id: 1,
	value: "Region1",
};
var reg2 = {
	id: 2,
	value: "Region2",
};
var reg3 = {
	id: 3,
	value: "Region3",
};
var reg4 = {
	id: 4,
	value: "Region4",
};
var reg5 = {
	id: 5,
	value: "Region5",
};

exports.regiones = function(options, callback){

    var practicioners = [];
    
    practicioners[0] = reg1;
    practicioners[1] = reg2;
    practicioners[2] = reg3;
    practicioners[3] = reg4;
    practicioners[4] = reg5;
    
    callback(null,practicioners);

}

exports.regiones.description = "web service de regiones";

exports.regiones.schema = {
 id_region: { 
    optional: true 
  }
};

var zona1 = {
	id: 1,
	value: "Zona1"
};
var zona2 = {
	id: 2,
	value: "Zona2"
};
var zona3 = {
	id: 3,
	value: "Zona3"
};
var zona4 = {
	id: 4,
	value: "Zona4"
};
var zona5 = {
	id: 5,
	value: "Zona5"
};

exports.zonas = function(options, callback){

    var zonas = [];
    
    zonas[0] = zona1;
    zonas[1] = zona2;
    zonas[2] = zona3;
    zonas[3] = zona4;
    zonas[4] = zona5;
    
    callback(null,zonas);

}

exports.zonas.description = "web service de regiones";

exports.zonas.schema = {
 id_region: { 
    optional: true 
  }
};
