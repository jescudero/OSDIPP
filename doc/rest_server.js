var restify = require('restify');


function respond(req, res, next) {
  res.send('hello ' + req.params.name);
}

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

var loc1 = {
	id: 1,
	value: "Zona1"
};
var loc2 = {
	id: 2,
	value: "Zona2"
};
var loc3 = {
	id: 3,
	value: "Zona3"
};


var tipoPrestador1 = {
	id: 1,
	value: "Tipo Prestador 1"
};
var tipoPrestador2 = {
	id: 2,
	value: "Tipo Prestador 2"
};
var tipoPrestador3 = {
	id: 3,
	value: "Tipo Prestador 3"
};

var especialidad1 = {
	id: 1,
	value: "Especialidad 1"
};
var especialidad2 = {
	id: 2,
	value: "Especialidad 2"
};

var plan1 = {
	id: 1,
	value: "Plan 1"
};
var plan2 = {
	id: 2,
	value: "Plan 2"
};
var plan3 = {
	id: 3,
	value: "Plan 3"
};

var localidad1 = {
	id: 1,
	value: "Localidad 1"
};
var localidad2 = {
	id: 2,
	value: "Localidad 2"
};

var cart1 = {nombre: "Clínida de Ojos Dr. Nano",
            observacion : "Observacion acerca del prestador",
            domicilios: [
            {
                 direccion: "Mendoza 45",
                 localidad: "Centro Morón",
                 zona: "Centro Morón",
                provincia: "Morón",
                telefonos: ["4489-4100", "1234-1234"]
            },
            {
                 direccion: "Mendoza 45",
                 localidad: "Centro Morón",
                 zona: "Centro Morón",
                provincia: "Morón",
                telefonos: ["4489-4100", "1234-1234"]
            }]
}

var cart2 = {nombre: "DIM",
            observacion : "Observacion acerca del prestador",
            domicilios: [
            {
                 direccion: "Belgrano 136",
                 localidad: "Ramos Mejía",
                 zona: "Ramos Mejía",
                provincia: "Ramos Mejía",
                telefonos: ["1234-1234"]
            }]
}

var cart3 = {nombre: "Clínida de Ojos Dr. Nano",
            observacion : "Observacion acerca del prestador",
            domicilios: [
            {
                 direccion: "Mendoza 45",
                 localidad: "Centro Morón",
                 zona: "Centro Morón",
                provincia: "Morón",
                telefonos: ["4489-4100", "1234-1234"]
            },
            {
                 direccion: "Mendoza 45",
                 localidad: "Centro Morón",
                 zona: "Centro Morón",
                provincia: "Morón",
                telefonos: ["4489-4100", "1234-1234"]
            },
            {
                 direccion: "Mendoza 45",
                 localidad: "Centro Morón",
                 zona: "Centro Morón",
                provincia: "Morón",
                telefonos: ["4489-4100", "1234-1234"]
            }]
}

var farm1 = {nombre: "Farmacity",
            observacion : "Observacion acerca de la farmacia",
            domicilios: [
            {
                 direccion: "Belgrano 136",
                 localidad: "Ramos Mejía",
                 zona: "Ramos Mejía",
                provincia: "Ramos Mejía",
                telefonos: ["1234-1234"]
            }]
}

var farm2 = {nombre: "Riadigos",
            observacion : "Observacion acerca de la farmacia",
            domicilios: [
            {
                 direccion: "Belgrano 136",
                 localidad: "Ramos Mejía",
                 zona: "Ramos Mejía",
                provincia: "Ramos Mejía",
                telefonos: ["1234-1234"]
            }]
}

function regiones(req, res, next) {

    regiones = [];

    regiones[0] = reg1;
    regiones[1] = reg2;
    regiones[2] = reg3;
    regiones[3] = reg4;
    regiones[4] = reg5;

    res.send(regiones);  
}

function regionesbyid(req, res, next) {

    res.send(regiones[req.params.id_region]);  
}

function zonasbyidregion(req, res, next) {

    zonas = [];

    zonas[0] = zona1;
    zonas[1] = zona2;
    zonas[2] = zona3;
    zonas[3] = zona4;
    zonas[4] = zona5;

    res.send(zonas);  
}


function tipo_prestadores(req, res, next) {

    tipoPrestadores = [];

    tipoPrestadores[0] = tipoPrestador1;
    tipoPrestadores[1] = tipoPrestador2;
    tipoPrestadores[2] = tipoPrestador3;


    res.send(tipoPrestadores);  
}

function especialidadesByIdTipoPrestador(req, res, next) {

    especialidades = [];

    especialidades[0] = especialidad1;
    especialidades[1] = especialidad2;


    res.send(especialidades);  
}

function planes(req, res, next) {

    planes = [];

    planes[0] = plan1;
    planes[1] = plan2;
    planes[2] = plan3;


    res.send(planes);  
}

function localidadesByIdZona(req, res, next) {

    localidades = [];

    localidades[0] = localidad1;
    localidades[1] = localidad2;


    res.send(localidades);  
}

function cartillas(req, res, next) {

    cart_s = [];
    
    cart_s[0] = cart1;
    cart_s[1] = cart2;

    res.send(cart_s);  
}


function farmacias(req, res, next) {

    farm_s = [];
    
    farm_s[0] = farm1;
    farm_s[1] = farm2;

    res.send(farm_s);  
}

var server = restify.createServer();
server.use(restify.queryParser());

server.get('/hello/:name', respond);
server.head('/hello/:name', respond);

server.get('/regiones/:id_region', regionesbyid);
server.head('/regiones/:id_region', regionesbyid);

server.get('/regiones', regiones);
server.head('/regiones', regiones);

server.get('/regiones/:id_region/zonas', zonasbyidregion);
server.head('/regiones/:id_region/zonas', zonasbyidregion);

server.get('/tipo_prestadores', tipo_prestadores);
server.head('/tipo_prestadores', tipo_prestadores);

server.get('/tipo_prestadores/:id_tipo_prestador/especialidades', especialidadesByIdTipoPrestador);
server.head('/tipo_prestadores/:id_tipo_prestador/especialidades', especialidadesByIdTipoPrestador);

server.get('/planes', planes);
server.head('/planes', planes);

server.get('/zonas/:id_zona/localidades', localidadesByIdZona);
server.head('/zonas/:id_zona/localidades', localidadesByIdZona);

server.get('/cartilla?:plan_id/:especialidad_id/:localidad_id', cartillas);
server.head('/cartilla?:plan_id/:especialidad_id/:localidad_id', cartillas);

server.get('/farmacias?:localidad_id', farmacias);
server.head('/farmacias?:localidad_id', farmacias);

server.listen(8080, function() {
  console.log('%s listening at %s', server.name, server.url);
});
