package br.ifsp.edu.bra.api_rest;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    private final ArrayList<User> users = new ArrayList<>();

    @Override
    public void add(User newUser) {
        users.add(newUser);
    }

    @Override
    public User find(String login) {
        for (User user : users) {
            if (user.getLogin().equals(login)) {
                return user;
            }
        }
        return null;
    }

    @Override
    public boolean remove(String login) {
        User user = find(login);
        if (user != null) {
            return users.remove(user);
        }
        return false;
    }

    public List<User> getAll() {
        return users;
    }
}
