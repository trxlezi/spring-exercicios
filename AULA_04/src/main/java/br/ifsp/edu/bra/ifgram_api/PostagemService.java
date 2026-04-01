package br.ifsp.edu.bra.ifgram_api;

import java.util.List;

public interface PostagemService {

    List<Postagem> getAll();

    Postagem findById(Long id);

    Postagem add(Postagem postagem);

    Postagem update(Long id, Postagem postagem);

    Postagem remove(Long id);
}
