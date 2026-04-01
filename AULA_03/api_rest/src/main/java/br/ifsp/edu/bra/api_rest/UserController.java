package br.ifsp.edu.bra.api_rest;

import java.net.URI;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class UserController {

    @Autowired
    private UserServiceImpl userService;

    @GetMapping("user")
    public ResponseEntity<List<User>> getAllUsers() {
        return ResponseEntity.ok(userService.getAll());
    }

    @GetMapping("user/{login}")
    public ResponseEntity<User> getUserByLogin(@PathVariable String login) {
        User user = userService.find(login);
        if (user != null) {
            return ResponseEntity.ok(user);
        }
        return ResponseEntity.notFound().build();
    }

    @PutMapping("user")
    public ResponseEntity<User> updatePasswordByLogin(
            @RequestParam String login,
            @RequestParam String newPwd) {
        User userToUpdate = userService.find(login);
        if (userToUpdate != null) {
            userToUpdate.setPassword(newPwd);
            return ResponseEntity.ok(userToUpdate);
        }
        return ResponseEntity.notFound().build();
    }

    @DeleteMapping("user/{login}")
    public ResponseEntity<User> deleteUser(@PathVariable String login) {
        User userToDelete = userService.find(login);
        if (userToDelete != null && userService.remove(login)) {
            return ResponseEntity.ok(userToDelete);
        }
        return ResponseEntity.notFound().build();
    }

    @PostMapping("user")
    public ResponseEntity<User> createUser(@RequestBody User user) {
        userService.add(user);
        return ResponseEntity.created(URI.create("/api/user/" + user.getLogin())).body(user);
    }
}
