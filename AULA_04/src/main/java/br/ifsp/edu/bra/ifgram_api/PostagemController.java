package br.ifsp.edu.bra.ifgram_api;

import java.net.URI;
import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/posts")
public class PostagemController {

    private final PostagemServiceImpl postagemService;

    public PostagemController(PostagemServiceImpl postagemService) {
        this.postagemService = postagemService;
    }

    @GetMapping
    public ResponseEntity<List<Postagem>> getAllPosts() {
        return ResponseEntity.ok(postagemService.getAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<Postagem> getPostById(@PathVariable Long id) {
        Postagem postagem = postagemService.findById(id);
        if (postagem == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(postagem);
    }

    @PostMapping
    public ResponseEntity<Postagem> createPost(@RequestBody Postagem postagem) {
        if (postagem.getTitulo() == null || postagem.getTitulo().isBlank()
                || postagem.getConteudo() == null || postagem.getConteudo().isBlank()) {
            return ResponseEntity.badRequest().build();
        }

        Postagem novaPostagem = postagemService.add(postagem);
        return ResponseEntity.created(URI.create("/api/posts/" + novaPostagem.getId())).body(novaPostagem);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Postagem> updatePost(@PathVariable Long id, @RequestBody Postagem postagem) {
        if (postagem.getTitulo() == null || postagem.getTitulo().isBlank()
                || postagem.getConteudo() == null || postagem.getConteudo().isBlank()
                || postagem.getDataCriacao() == null || postagem.getDataCriacao().isBlank()) {
            return ResponseEntity.badRequest().build();
        }

        Postagem postagemAtualizada = postagemService.update(id, postagem);
        if (postagemAtualizada == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(postagemAtualizada);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Postagem> deletePost(@PathVariable Long id) {
        Postagem postagemRemovida = postagemService.remove(id);
        if (postagemRemovida == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(postagemRemovida);
    }
}
