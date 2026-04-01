package br.ifsp.edu.bra.ifgram_api;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;

import org.springframework.stereotype.Service;

@Service
public class PostagemServiceImpl implements PostagemService {

    private final List<Postagem> postagens = new ArrayList<>();
    private final AtomicLong sequence = new AtomicLong(1);

    @Override
    public List<Postagem> getAll() {
        return postagens;
    }

    @Override
    public Postagem findById(Long id) {
        for (Postagem postagem : postagens) {
            if (postagem.getId().equals(id)) {
                return postagem;
            }
        }
        return null;
    }

    @Override
    public Postagem add(Postagem postagem) {
        postagem.setId(sequence.getAndIncrement());
        if (postagem.getDataCriacao() == null || postagem.getDataCriacao().isBlank()) {
            postagem.setDataCriacao(LocalDate.now().toString());
        }
        postagens.add(postagem);
        return postagem;
    }

    @Override
    public Postagem update(Long id, Postagem postagemAtualizada) {
        Postagem postagemExistente = findById(id);
        if (postagemExistente == null) {
            return null;
        }

        postagemExistente.setTitulo(postagemAtualizada.getTitulo());
        postagemExistente.setConteudo(postagemAtualizada.getConteudo());
        postagemExistente.setDataCriacao(postagemAtualizada.getDataCriacao());
        return postagemExistente;
    }

    @Override
    public Postagem remove(Long id) {
        Postagem postagem = findById(id);
        if (postagem != null) {
            postagens.remove(postagem);
        }
        return postagem;
    }
}
