package com.example.demo.models;

import java.util.Date;
import org.bson.codecs.pojo.annotations.BsonId;
import org.bson.types.ObjectId;

public class Coordinador {
	 @BsonId
     ObjectId _id;
	 private String nombre;
	 private String apellido;
	 private String estado_salud;
	 private String password;
	 private String correo_electronico;
	 private Long id_institucion;
	 private Date created_at;
	 private Date updated_at;

	 

	public ObjectId get_id() {
		return _id;
	}


	public void set_id(ObjectId _id) {
		this._id = _id;
	}


	public Long getId_institucion() {
		return id_institucion;
	}


	public void setId_institucion(Long id_institucion) {
		this.id_institucion = id_institucion;
	}


	public String getNombre() {
		return nombre;
	}


	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


	public String getApellido() {
		return apellido;
	}


	public void setApellido(String apellido) {
		this.apellido = apellido;
	}


	public String getEstado_salud() {
		return estado_salud;
	}


	public void setEstado_salud(String estado_salud) {
		this.estado_salud = estado_salud;
	}


	public String getCorreo_electronico() {
		return correo_electronico;
	}


	public void setCorreo_electronico(String correo_electronico) {
		this.correo_electronico = correo_electronico;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public Date getCreated_at() {
		return created_at;
	}


	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}


	public Date getUpdated_at() {
		return updated_at;
	}


	public void setUpdated_at(Date updated_at) {
		this.updated_at = updated_at;
	}
	
	
	 
	 
	 
	 
}

