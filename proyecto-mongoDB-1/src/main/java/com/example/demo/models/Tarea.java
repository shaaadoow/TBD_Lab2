package com.example.demo.models;

import java.util.Date;

import org.bson.codecs.pojo.annotations.BsonId;
import org.bson.types.ObjectId;

public class Tarea {
	@BsonId
    ObjectId _id;
    private String nombre;
    private String descripcion;
    private Integer id_estado_tarea;
    private Date created_at;
    private Date updated_at;
    private Integer id_emergencia;
    private String coordenadas;


    //Getters y Setters
    public ObjectId get_id() {
		return _id;
	}


	public void set_id(ObjectId _id) {
		this._id = _id;
	}

    public String getNombre(){ return nombre; }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion(){ return descripcion; }
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Integer getIdEstadoTarea() {
        return id_estado_tarea;
    }
    public void setIdEstadoTarea(Integer id) {
        this.id_estado_tarea = id;
    }

    public Integer getIdEmergencia() { return id_emergencia; }
    public void setIdEmeTarea(Integer id) { this.id_emergencia = id; }

    public Date getCreatedAt() {
        return created_at;
    }
    public void setCreatedAt(Date fecha) {
        this.created_at = fecha;
    }

    public Date getUpdatedAt() {
        return updated_at;
    }
    public void setUpdateAt(Date fecha) {
        this.updated_at = fecha;
    }


    public String getCoordenadas() {
        return coordenadas;
    }
    public void setCoordenadas(String coordenadas) {
        this.coordenadas = coordenadas;
    }

}
