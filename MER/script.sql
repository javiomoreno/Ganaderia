CREATE TABLE TipoUsuarios (
  tiusiden INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  tiusnomb VARCHAR(50) NULL,
  tiusdesc VARCHAR(250) NULL,
  PRIMARY KEY(tiusiden)
);

CREATE TABLE Suelos (
  sueliden INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  suelnomb VARCHAR(50) NULL,
  sueldesc VARCHAR(250) NULL,
  sueltipo VARCHAR(50) NULL,
  suelcons VARCHAR(100) NULL,
  suelcomp VARCHAR(100) NULL,
  PRIMARY KEY(sueliden)
);

CREATE TABLE Pastos (
  pastiden INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  pastnomb VARCHAR(50) NULL,
  pastdesc VARCHAR(200) NULL,
  pastespe VARCHAR(100) NULL,
  PRIMARY KEY(pastiden)
);

CREATE TABLE Ganados (
  ganaiden INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  gananomb VARCHAR(50) NULL,
  ganadesc VARCHAR(250) NULL,
  ganaespe VARCHAR(50) NULL,
  ganapeso VARCHAR(50) NULL,
  PRIMARY KEY(ganaiden)
);

CREATE TABLE Usuarios (
  usuaiden INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  TipoUsuarios_tiusiden INTEGER UNSIGNED NOT NULL,
  usuanomb VARCHAR(50) NULL,
  usuaapel VARCHAR(50) NULL,
  usuatele VARCHAR(50) NULL,
  usuadire VARCHAR(200) NULL,
  usuacorr VARCHAR(100) NULL,
  usuapass VARCHAR(250) NULL,
  PRIMARY KEY(usuaiden),
  INDEX Usuarios_FKIndex1(TipoUsuarios_tiusiden),
  FOREIGN KEY(TipoUsuarios_tiusiden)
    REFERENCES TipoUsuarios(tiusiden)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE ReglasInferencias (
  reiniden INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Usuarios_usuaiden INTEGER UNSIGNED NOT NULL,
  reinfech DATE NULL,
  reincons VARCHAR(300) NULL,
  PRIMARY KEY(reiniden),
  INDEX ReglasInferencias_FKIndex1(Usuarios_usuaiden),
  FOREIGN KEY(Usuarios_usuaiden)
    REFERENCES Usuarios(usuaiden)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Ganados_Pastos (
  gapaiden INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Ganados_ganaiden INTEGER UNSIGNED NOT NULL,
  Pastos_pastiden INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(gapaiden),
  INDEX Ganados_Pastos_FKIndex1(Pastos_pastiden),
  INDEX Ganados_Pastos_FKIndex2(Ganados_ganaiden),
  FOREIGN KEY(Pastos_pastiden)
    REFERENCES Pastos(pastiden)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Ganados_ganaiden)
    REFERENCES Ganados(ganaiden)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Pastos_Tierras (
  patiiden INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Suelos_sueliden INTEGER UNSIGNED NOT NULL,
  Pastos_pastiden INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(patiiden),
  INDEX Pastos_Tierras_FKIndex1(Pastos_pastiden),
  INDEX Pastos_Tierras_FKIndex2(Suelos_sueliden),
  FOREIGN KEY(Pastos_pastiden)
    REFERENCES Pastos(pastiden)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Suelos_sueliden)
    REFERENCES Suelos(sueliden)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Tierras_Ganados (
  tigaiden INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Suelos_sueliden INTEGER UNSIGNED NOT NULL,
  Ganados_ganaiden INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(tigaiden),
  INDEX Tierras_Ganados_FKIndex1(Suelos_sueliden),
  INDEX Tierras_Ganados_FKIndex2(Ganados_ganaiden),
  FOREIGN KEY(Suelos_sueliden)
    REFERENCES Suelos(sueliden)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Ganados_ganaiden)
    REFERENCES Ganados(ganaiden)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);


