package com.example.cloudcomputing.springdb;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/film")
public class FilmController {
    @Autowired
    private FilmRepository filmRepository;

    @GetMapping
    public ResponseEntity<List<Film>> getAll() {
       return ResponseEntity.ok(filmRepository.findAll());
    }

    @PostMapping
    public ResponseEntity<Film> create(@RequestBody Film film) {
       return ResponseEntity.ok(filmRepository.saveAndFlush(film));

    }
}
