package com.example.cloudcomputing.springdb;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.UnknownHostException;
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

    @GetMapping("/ip")
    public ResponseEntity<String> getIp() {
        try (final DatagramSocket datagramSocket = new DatagramSocket()) {
            datagramSocket.connect(InetAddress.getByName("8.8.8.8"), 12345);
            String ip = datagramSocket.getLocalAddress().getHostAddress();
            return ResponseEntity.ok(ip);
        } catch (Exception e) {
            return ResponseEntity.internalServerError().body("Could not get IP address!");
        }
    }
}
