package com.example.demo.services;

import com.example.demo.models.Voluntario;
import com.example.demo.repositories.VoluntarioRepository;
import com.example.demo.repositories.VoluntarioTareaRepository;
import com.mongodb.client.FindIterable;
import org.bson.Document;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@RestController
public class VoluntarioTareaService {
    private final VoluntarioTareaRepository voluntarioTareaRepository;
    VoluntarioTareaService(VoluntarioTareaRepository voluntarioTareaRepository){
        this.voluntarioTareaRepository = voluntarioTareaRepository;
    }
    @GetMapping("/voluntariosTarea/{idTarea}")
    public ArrayList<Document>findByTarea(@PathVariable(value = "idTarea") String idTarea){
        ArrayList<Document> result = voluntarioTareaRepository.findByTarea(idTarea);
        return result;
    }


}
