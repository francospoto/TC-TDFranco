
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 02/29/2016 18:36:12
-- Generated from EDMX file: C:\Users\Dante\Documents\GitHub\WASSDiploma\WASS Diploma\Modelo_Entidades\WASSTD.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO

USE [WASSTD];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_UsuarioGrupo_Usuario]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UsuariosGrupos] DROP CONSTRAINT [FK_UsuarioGrupo_Usuario];
GO
IF OBJECT_ID(N'[dbo].[FK_UsuarioGrupo_Grupo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UsuariosGrupos] DROP CONSTRAINT [FK_UsuarioGrupo_Grupo];
GO
IF OBJECT_ID(N'[dbo].[FK_PerfilGrupo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Perfiles] DROP CONSTRAINT [FK_PerfilGrupo];
GO
IF OBJECT_ID(N'[dbo].[FK_PerfilPermiso]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Perfiles] DROP CONSTRAINT [FK_PerfilPermiso];
GO
IF OBJECT_ID(N'[dbo].[FK_PerfilFormulario]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Perfiles] DROP CONSTRAINT [FK_PerfilFormulario];
GO
IF OBJECT_ID(N'[dbo].[FK_FormularioModulo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Formularios] DROP CONSTRAINT [FK_FormularioModulo];
GO
IF OBJECT_ID(N'[dbo].[FK_ProvinciaLocalidades]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Localidades] DROP CONSTRAINT [FK_ProvinciaLocalidades];
GO
IF OBJECT_ID(N'[dbo].[FK_PersonaDirecciones]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Direcciones] DROP CONSTRAINT [FK_PersonaDirecciones];
GO
IF OBJECT_ID(N'[dbo].[FK_Tipo_DocumentoPersona]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Personas] DROP CONSTRAINT [FK_Tipo_DocumentoPersona];
GO
IF OBJECT_ID(N'[dbo].[FK_EstadoPersona]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Personas] DROP CONSTRAINT [FK_EstadoPersona];
GO
IF OBJECT_ID(N'[dbo].[FK_LocalidadDireccion]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Direcciones] DROP CONSTRAINT [FK_LocalidadDireccion];
GO
IF OBJECT_ID(N'[dbo].[FK_Detalles_del_Tramite]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Detalles_Tramites] DROP CONSTRAINT [FK_Detalles_del_Tramite];
GO
IF OBJECT_ID(N'[dbo].[FK_TramitesPersona]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Tramites] DROP CONSTRAINT [FK_TramitesPersona];
GO
IF OBJECT_ID(N'[dbo].[FK_Tipo_PersonaPersona]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Personas] DROP CONSTRAINT [FK_Tipo_PersonaPersona];
GO
IF OBJECT_ID(N'[dbo].[FK_Tipo_TramiteTramite]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Tramites] DROP CONSTRAINT [FK_Tipo_TramiteTramite];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Usuarios]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Usuarios];
GO
IF OBJECT_ID(N'[dbo].[Grupos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Grupos];
GO
IF OBJECT_ID(N'[dbo].[Perfiles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Perfiles];
GO
IF OBJECT_ID(N'[dbo].[Permisos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Permisos];
GO
IF OBJECT_ID(N'[dbo].[Formularios]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Formularios];
GO
IF OBJECT_ID(N'[dbo].[Modulos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Modulos];
GO
IF OBJECT_ID(N'[dbo].[Personas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Personas];
GO
IF OBJECT_ID(N'[dbo].[Localidades]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Localidades];
GO
IF OBJECT_ID(N'[dbo].[Provincias]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Provincias];
GO
IF OBJECT_ID(N'[dbo].[Estados]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Estados];
GO
IF OBJECT_ID(N'[dbo].[Direcciones]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Direcciones];
GO
IF OBJECT_ID(N'[dbo].[Tipos_Documentos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tipos_Documentos];
GO
IF OBJECT_ID(N'[dbo].[Tramites]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tramites];
GO
IF OBJECT_ID(N'[dbo].[Detalles_Tramites]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Detalles_Tramites];
GO
IF OBJECT_ID(N'[dbo].[Tipos_Personas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tipos_Personas];
GO
IF OBJECT_ID(N'[dbo].[Tipos_Tramites]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tipos_Tramites];
GO
IF OBJECT_ID(N'[dbo].[UsuariosGrupos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UsuariosGrupos];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Usuarios'
CREATE TABLE [dbo].[Usuarios] (
    [id] int IDENTITY(1,1) NOT NULL,
    [nombre_apellido] nvarchar(max)  NOT NULL,
    [clave] nvarchar(max)  NOT NULL,
    [email] nvarchar(max)  NOT NULL,
    [estado] bit  NOT NULL,
    [usuario] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Grupos'
CREATE TABLE [dbo].[Grupos] (
    [id] int IDENTITY(1,1) NOT NULL,
    [descripcion] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Perfiles'
CREATE TABLE [dbo].[Perfiles] (
    [id] int IDENTITY(1,1) NOT NULL,
    [Grupo_id] int  NOT NULL,
    [Permiso_id] int  NOT NULL,
    [Formulario_id] int  NOT NULL
);
GO

-- Creating table 'Permisos'
CREATE TABLE [dbo].[Permisos] (
    [id] int IDENTITY(1,1) NOT NULL,
    [descripcion] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Formularios'
CREATE TABLE [dbo].[Formularios] (
    [id] int IDENTITY(1,1) NOT NULL,
    [descripcion] nvarchar(max)  NOT NULL,
    [nombredemuestra] nvarchar(max)  NOT NULL,
    [Modulo_id] int  NOT NULL
);
GO

-- Creating table 'Modulos'
CREATE TABLE [dbo].[Modulos] (
    [id] int IDENTITY(1,1) NOT NULL,
    [descripcion] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Personas'
CREATE TABLE [dbo].[Personas] (
    [dni] int  NOT NULL,
    [nombre_apellido] nvarchar(max)  NOT NULL,
    [sexo] nvarchar(max)  NOT NULL,
    [telefono] nvarchar(max)  NOT NULL,
    [celular] nvarchar(max)  NOT NULL,
    [email1] nvarchar(max)  NOT NULL,
    [observaciones] nvarchar(max)  NOT NULL,
    [clave_fiscal] nvarchar(max)  NOT NULL,
    [fecha_nacimiento] datetime  NOT NULL,
    [Tipo_PersonaId] int  NOT NULL,
    [Tipo_Documento_id] int  NOT NULL,
    [Estado_id] int  NOT NULL
);
GO

-- Creating table 'Localidades'
CREATE TABLE [dbo].[Localidades] (
    [id] int IDENTITY(1,1) NOT NULL,
    [nombre] nvarchar(max)  NOT NULL,
    [cp] int  NOT NULL,
    [Provincia_id] int  NOT NULL
);
GO

-- Creating table 'Provincias'
CREATE TABLE [dbo].[Provincias] (
    [id] int IDENTITY(1,1) NOT NULL,
    [nombre] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Estados'
CREATE TABLE [dbo].[Estados] (
    [id] int IDENTITY(1,1) NOT NULL,
    [descripcion] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Direcciones'
CREATE TABLE [dbo].[Direcciones] (
    [id] int IDENTITY(1,1) NOT NULL,
    [direccion] nvarchar(max)  NOT NULL,
    [Persona_dni] int  NOT NULL,
    [Localidad_id] int  NOT NULL
);
GO

-- Creating table 'Tipos_Documentos'
CREATE TABLE [dbo].[Tipos_Documentos] (
    [id] int IDENTITY(1,1) NOT NULL,
    [descripcion] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Tramites'
CREATE TABLE [dbo].[Tramites] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Tipo_Tramite_id] int  NOT NULL,
    [Estado_id] int  NOT NULL,
    [Persona_dni] int  NOT NULL
);
GO

-- Creating table 'Detalles_Tramites'
CREATE TABLE [dbo].[Detalles_Tramites] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [descripcion] nvarchar(max)  NOT NULL,
    [fecha_desde] datetime  NULL,
    [TramiteId] int  NOT NULL
);
GO

-- Creating table 'Tipos_Personas'
CREATE TABLE [dbo].[Tipos_Personas] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [descripcion] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Tipos_Tramites'
CREATE TABLE [dbo].[Tipos_Tramites] (
    [id] int IDENTITY(1,1) NOT NULL,
    [descripcion] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'UsuariosGrupos'
CREATE TABLE [dbo].[UsuariosGrupos] (
    [Usuarios_id] int  NOT NULL,
    [Grupos_id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [id] in table 'Usuarios'
ALTER TABLE [dbo].[Usuarios]
ADD CONSTRAINT [PK_Usuarios]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'Grupos'
ALTER TABLE [dbo].[Grupos]
ADD CONSTRAINT [PK_Grupos]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'Perfiles'
ALTER TABLE [dbo].[Perfiles]
ADD CONSTRAINT [PK_Perfiles]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'Permisos'
ALTER TABLE [dbo].[Permisos]
ADD CONSTRAINT [PK_Permisos]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'Formularios'
ALTER TABLE [dbo].[Formularios]
ADD CONSTRAINT [PK_Formularios]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'Modulos'
ALTER TABLE [dbo].[Modulos]
ADD CONSTRAINT [PK_Modulos]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [dni] in table 'Personas'
ALTER TABLE [dbo].[Personas]
ADD CONSTRAINT [PK_Personas]
    PRIMARY KEY CLUSTERED ([dni] ASC);
GO

-- Creating primary key on [id] in table 'Localidades'
ALTER TABLE [dbo].[Localidades]
ADD CONSTRAINT [PK_Localidades]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'Provincias'
ALTER TABLE [dbo].[Provincias]
ADD CONSTRAINT [PK_Provincias]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'Estados'
ALTER TABLE [dbo].[Estados]
ADD CONSTRAINT [PK_Estados]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'Direcciones'
ALTER TABLE [dbo].[Direcciones]
ADD CONSTRAINT [PK_Direcciones]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'Tipos_Documentos'
ALTER TABLE [dbo].[Tipos_Documentos]
ADD CONSTRAINT [PK_Tipos_Documentos]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [Id] in table 'Tramites'
ALTER TABLE [dbo].[Tramites]
ADD CONSTRAINT [PK_Tramites]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Detalles_Tramites'
ALTER TABLE [dbo].[Detalles_Tramites]
ADD CONSTRAINT [PK_Detalles_Tramites]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Tipos_Personas'
ALTER TABLE [dbo].[Tipos_Personas]
ADD CONSTRAINT [PK_Tipos_Personas]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [id] in table 'Tipos_Tramites'
ALTER TABLE [dbo].[Tipos_Tramites]
ADD CONSTRAINT [PK_Tipos_Tramites]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [Usuarios_id], [Grupos_id] in table 'UsuariosGrupos'
ALTER TABLE [dbo].[UsuariosGrupos]
ADD CONSTRAINT [PK_UsuariosGrupos]
    PRIMARY KEY CLUSTERED ([Usuarios_id], [Grupos_id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Usuarios_id] in table 'UsuariosGrupos'
ALTER TABLE [dbo].[UsuariosGrupos]
ADD CONSTRAINT [FK_UsuarioGrupo_Usuario]
    FOREIGN KEY ([Usuarios_id])
    REFERENCES [dbo].[Usuarios]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Grupos_id] in table 'UsuariosGrupos'
ALTER TABLE [dbo].[UsuariosGrupos]
ADD CONSTRAINT [FK_UsuarioGrupo_Grupo]
    FOREIGN KEY ([Grupos_id])
    REFERENCES [dbo].[Grupos]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UsuarioGrupo_Grupo'
CREATE INDEX [IX_FK_UsuarioGrupo_Grupo]
ON [dbo].[UsuariosGrupos]
    ([Grupos_id]);
GO

-- Creating foreign key on [Grupo_id] in table 'Perfiles'
ALTER TABLE [dbo].[Perfiles]
ADD CONSTRAINT [FK_PerfilGrupo]
    FOREIGN KEY ([Grupo_id])
    REFERENCES [dbo].[Grupos]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PerfilGrupo'
CREATE INDEX [IX_FK_PerfilGrupo]
ON [dbo].[Perfiles]
    ([Grupo_id]);
GO

-- Creating foreign key on [Permiso_id] in table 'Perfiles'
ALTER TABLE [dbo].[Perfiles]
ADD CONSTRAINT [FK_PerfilPermiso]
    FOREIGN KEY ([Permiso_id])
    REFERENCES [dbo].[Permisos]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PerfilPermiso'
CREATE INDEX [IX_FK_PerfilPermiso]
ON [dbo].[Perfiles]
    ([Permiso_id]);
GO

-- Creating foreign key on [Formulario_id] in table 'Perfiles'
ALTER TABLE [dbo].[Perfiles]
ADD CONSTRAINT [FK_PerfilFormulario]
    FOREIGN KEY ([Formulario_id])
    REFERENCES [dbo].[Formularios]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PerfilFormulario'
CREATE INDEX [IX_FK_PerfilFormulario]
ON [dbo].[Perfiles]
    ([Formulario_id]);
GO

-- Creating foreign key on [Modulo_id] in table 'Formularios'
ALTER TABLE [dbo].[Formularios]
ADD CONSTRAINT [FK_FormularioModulo]
    FOREIGN KEY ([Modulo_id])
    REFERENCES [dbo].[Modulos]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FormularioModulo'
CREATE INDEX [IX_FK_FormularioModulo]
ON [dbo].[Formularios]
    ([Modulo_id]);
GO

-- Creating foreign key on [Provincia_id] in table 'Localidades'
ALTER TABLE [dbo].[Localidades]
ADD CONSTRAINT [FK_ProvinciaLocalidades]
    FOREIGN KEY ([Provincia_id])
    REFERENCES [dbo].[Provincias]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ProvinciaLocalidades'
CREATE INDEX [IX_FK_ProvinciaLocalidades]
ON [dbo].[Localidades]
    ([Provincia_id]);
GO

-- Creating foreign key on [Persona_dni] in table 'Direcciones'
ALTER TABLE [dbo].[Direcciones]
ADD CONSTRAINT [FK_PersonaDirecciones]
    FOREIGN KEY ([Persona_dni])
    REFERENCES [dbo].[Personas]
        ([dni])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonaDirecciones'
CREATE INDEX [IX_FK_PersonaDirecciones]
ON [dbo].[Direcciones]
    ([Persona_dni]);
GO

-- Creating foreign key on [Tipo_Documento_id] in table 'Personas'
ALTER TABLE [dbo].[Personas]
ADD CONSTRAINT [FK_Tipo_DocumentoPersona]
    FOREIGN KEY ([Tipo_Documento_id])
    REFERENCES [dbo].[Tipos_Documentos]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Tipo_DocumentoPersona'
CREATE INDEX [IX_FK_Tipo_DocumentoPersona]
ON [dbo].[Personas]
    ([Tipo_Documento_id]);
GO

-- Creating foreign key on [Estado_id] in table 'Personas'
ALTER TABLE [dbo].[Personas]
ADD CONSTRAINT [FK_EstadoPersona]
    FOREIGN KEY ([Estado_id])
    REFERENCES [dbo].[Estados]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_EstadoPersona'
CREATE INDEX [IX_FK_EstadoPersona]
ON [dbo].[Personas]
    ([Estado_id]);
GO

-- Creating foreign key on [Localidad_id] in table 'Direcciones'
ALTER TABLE [dbo].[Direcciones]
ADD CONSTRAINT [FK_LocalidadDireccion]
    FOREIGN KEY ([Localidad_id])
    REFERENCES [dbo].[Localidades]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_LocalidadDireccion'
CREATE INDEX [IX_FK_LocalidadDireccion]
ON [dbo].[Direcciones]
    ([Localidad_id]);
GO

-- Creating foreign key on [TramiteId] in table 'Detalles_Tramites'
ALTER TABLE [dbo].[Detalles_Tramites]
ADD CONSTRAINT [FK_Detalles_del_Tramite]
    FOREIGN KEY ([TramiteId])
    REFERENCES [dbo].[Tramites]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Detalles_del_Tramite'
CREATE INDEX [IX_FK_Detalles_del_Tramite]
ON [dbo].[Detalles_Tramites]
    ([TramiteId]);
GO

-- Creating foreign key on [Persona_dni] in table 'Tramites'
ALTER TABLE [dbo].[Tramites]
ADD CONSTRAINT [FK_TramitesPersona]
    FOREIGN KEY ([Persona_dni])
    REFERENCES [dbo].[Personas]
        ([dni])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TramitesPersona'
CREATE INDEX [IX_FK_TramitesPersona]
ON [dbo].[Tramites]
    ([Persona_dni]);
GO

-- Creating foreign key on [Tipo_PersonaId] in table 'Personas'
ALTER TABLE [dbo].[Personas]
ADD CONSTRAINT [FK_Tipo_PersonaPersona]
    FOREIGN KEY ([Tipo_PersonaId])
    REFERENCES [dbo].[Tipos_Personas]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Tipo_PersonaPersona'
CREATE INDEX [IX_FK_Tipo_PersonaPersona]
ON [dbo].[Personas]
    ([Tipo_PersonaId]);
GO

-- Creating foreign key on [Tipo_Tramite_id] in table 'Tramites'
ALTER TABLE [dbo].[Tramites]
ADD CONSTRAINT [FK_Tipo_TramiteTramite]
    FOREIGN KEY ([Tipo_Tramite_id])
    REFERENCES [dbo].[Tipos_Tramites]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Tipo_TramiteTramite'
CREATE INDEX [IX_FK_Tipo_TramiteTramite]
ON [dbo].[Tramites]
    ([Tipo_Tramite_id]);
GO

-- Creating foreign key on [Estado_id] in table 'Tramites'
ALTER TABLE [dbo].[Tramites]
ADD CONSTRAINT [FK_EstadoTramite]
    FOREIGN KEY ([Estado_id])
    REFERENCES [dbo].[Estados]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_EstadoTramite'
CREATE INDEX [IX_FK_EstadoTramite]
ON [dbo].[Tramites]
    ([Estado_id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------