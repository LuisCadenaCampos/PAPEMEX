
CREATE TABLE CategoriaP(
	IDCategoria INT,
	NombreCategoria VARCHAR(40),
	Descripcion VARCHAR(70)
	--Llave primaria de CategoriaProductos
	CONSTRAINT PK_IDCategoria PRIMARY KEY (IDCategoria)
)


CREATE TABLE SUBCategoriaP(
	IDSubcategoria INT,
	IDCategoria INT NOT NULL,
	SubCatNombre VARCHAR(50), 
	DescripcionSubCat VARCHAR(100),
	---Llave primaria de SUBCategoriaP
	CONSTRAINT PK_IDSubcategoria PRIMARY KEY(IDSubcategoria),
	--Llave foranea de  SUBCateogoriaP
	CONSTRAINT FK_IDCategoria FOREIGN KEY (IDCategoria) REFERENCES CategoriaP(IDCategoria)
)



CREATE TABLE Fabricante(
	IDFabricante INT,
	NombreFabricante Varchar(30) NOT NULL,
	NombreContacto VARCHAR(30) NOT NULL,
	TituloContacto  VARCHAR(80) NOT NULL,
	Pais VARCHAR(3) NOT NULL, 
	EntidadFederativa VARCHAR (30) NOT NULL,
	Ciudad VARCHAR(20) NOT NULL,
	Dirección VARCHAR(200) NOT NULL,
	CP VARCHAR (5) NOT NULL ,
	Telefono VARCHAR(10),
	CorreoE VARCHAR (25),
	------LLAVE PRIMARIA
	CONSTRAINT PK_IDFabricante PRIMARY KEY (IDFabricante)
)

CREATE TABLE Productos(
	IDProducto INT,
	NombreP VARCHAR (35) NOT NULL,
	Descripcion VARCHAR(40) NOT NULL,
	DiasGarantia VARCHAR(30) NULL,
	IDCategoria INT NOT  NULL,
	IDSubCategoria INT NOT NULL,
	IDFabricante INT NOT NULL,
	PrecioUnitario DECIMAL(10,2) NOT NULL,
	UnidadesEnAlmacen INT NOT NULL,
	UnidadesApartadas INT NOT NULL,
	UnidadesReabastecimiento INT NOT NULL,
	Descontinuado BIT NOT NULL,
	--Llave primaria de IDProducto
	CONSTRAINT PK_IDProducto PRIMARY KEY (IDProducto),
	--Llaves foraneas 
	CONSTRAINT FK_IDCategoria_Productos FOREIGN KEY (IDCategoria) REFERENCES CategoriaP(IDCategoria),
	CONSTRAINT FK_IDSubCategoria_Productos FOREIGN KEY (IDSubCategoria) REFERENCES SUBCategoriaP(IDSubcategoria),
	CONSTRAINT FK_IDFabricante_Productos FOREIGN KEY (IDFabricante)  REFERENCES Fabricante(IDFabricante)
)

CREATE TABLE CategoriaE( 
	IDCatEmp INT,
	NombCat VARCHAR(25) NOT NULL,
	NombCatDescp VARCHAR(40) NOT NULL,
	--CREAMOS PRIMARY KEY
	CONSTRAINT PK_IDCatEmp PRIMARY KEY(IDCatEmp)
)


CREATE TABLE Empleado(
	IDEmpleado INT,
	IDCatEmp INT NOT NULL,
	Estatus BIT NOT NULL,
	NombreEmp VARCHAR(30) NOT NULL,
	ApPat VARCHAR(30) NOT NULL,
	ApMat VARCHAR(30) NOT NULL,
	RFC VARCHAR(13) UNIQUE NOT NULL,
	FechaNac DATETIME,
	EdadContratacion INT NULL,
	FechaContratacion DATETIME NOT NULL,
	FechaRenunciaDespido DATETIME NULL,
	CP VARCHAR(5) NOT NULL,
	Pais VARCHAR(3) NOT NULL, 
	EntidadFederativa VARCHAR (30) NOT NULL,
	Ciudad VARCHAR(40) NOT NULL,
	Dirección VARCHAR(200) NOT NULL,
	Telefono VARCHAR(5) NULL,
	CorreoE VARCHAR (25) NULL,
	--CREAR LLAVE PRIMARIA 
	CONSTRAINT PK_IDEmpleado PRIMARY KEY (IDEmpleado),
	--CREAMOS LLAVE FORANEA
	CONSTRAINT FK_IDCatEmp FOREIGN KEY (IDCatEmp) REFERENCES CategoriaE(IDCatEmp)
)




CREATE TABLE Clientes(
	IDCliente INT,
	NombCliente VARCHAR(30),
	ApPatCliente VARCHAR(30),
	ApMatCliente VARCHAR(30),
	NomCompania VARCHAR(30) NULL,
	RFC VARCHAR(13) UNIQUE NOT NULL,
	CP VARCHAR(5) NOT NULL,
	Pais VARCHAR(3), 
	EntidadFederativa VARCHAR (30),
	Ciudad VARCHAR(20),
	Dirección VARCHAR(200),
	Telefono VARCHAR(10),
	CorreoE VARCHAR(30)
	--CREAMOS PRIMARY KEY
	CONSTRAINT PK_IDClietne PRIMARY KEY(IDCliente)
)


CREATE TABLE FormasPago(
	IDFormaPago INT,
	NombreFormaPago VARCHAR(40) NOT NULL,
	DescripcionFPago VARCHAR(60) NOT NULL,
	--CREAMOS PRIMARY KEY 
	CONSTRAINT PK_IDFormaPago PRIMARY KEY(IDFormaPago)
)

CREATE TABLE Ventas(
	IDVenta INT,
	IDEmpleado INT NOT NULL,
	IDCliente INT NOT NULL,
	FechaVta DATETIME NOT NULL,
	IDFormaPago INT NOT NULL,
	--CREAMOS PRIMARY KEY
	CONSTRAINT PK_IDVenta PRIMARY KEY (IDVenta),
	--CREAMOS FOREIGN KEY 
	CONSTRAINT FK_IDEmpleado FOREIGN KEY(IDEmpleado) REFERENCES Empleado(IDEmpleado),
	CONSTRAINT FK_IDFormaPago FOREIGN KEY(IDFormaPago) REFERENCES FormasPago(IDFormaPago),
	CONSTRAINT FK_IDCliente FOREIGN KEY (IDCliente) REFERENCES Clientes(IDCliente)
	
)

---NO EJECUTAR ESTA CREACION DE LA TABLA
CREATE TABLE VentasD(
	IDVenta INT NOT NULL,
	IDProducto INT NOT NULL,
	PrecioUnit DECIMAL(10,2),
	Cantidad INT,
	Descuento DECIMAL(2,2),
	---CREAMOS LAS LLAVES FORANEAS 
	CONSTRAINT FK_IDVenta FOREIGN KEY(IDVenta) REFERENCES Ventas(IDVenta),
	CONSTRAINT FK_IDProducto FOREIGN KEY(IDProducto) REFERENCES Productos(IDProducto)
)
