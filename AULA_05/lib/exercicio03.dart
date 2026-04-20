import 'package:flutter/material.dart';

void main() {
  runApp(const ConstraintsExerciseApp());
}

class ConstraintsExerciseApp extends StatelessWidget {
  const ConstraintsExerciseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ConstraintsPage(),
    );
  }
}

class ConstraintsPage extends StatelessWidget {
  const ConstraintsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercicio 03')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Exemplos:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            exemplo(
              'Exemplo 1 - Container ocupa o espaco recebido',
              Container(color: Colors.red),
            ),
            exemplo(
              'Exemplo 3 - Center deixa o Container ter 100 x 100',
              Center(
                child: Container(width: 100, height: 100, color: Colors.red),
              ),
            ),
            exemplo(
              'Exemplo 5 - Container infinito fica limitado pelo espaco disponivel',
              Center(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.red,
                ),
              ),
            ),
            exemplo(
              'Exemplo 10 - ConstrainedBox aplica tamanho minimo',
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 70,
                    minHeight: 70,
                    maxWidth: 150,
                    maxHeight: 150,
                  ),
                  child: Container(color: Colors.red, width: 10, height: 10),
                ),
              ),
            ),
            exemplo(
              'Exemplo 11 - ConstrainedBox aplica tamanho maximo',
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 70,
                    minHeight: 70,
                    maxWidth: 150,
                    maxHeight: 150,
                  ),
                  child: Container(
                    color: Colors.red,
                    width: 1000,
                    height: 1000,
                  ),
                ),
              ),
            ),
            exemplo(
              'Exemplo 13 - UnconstrainedBox deixa o filho escolher o tamanho',
              UnconstrainedBox(
                child: Container(color: Colors.red, width: 20, height: 50),
              ),
            ),
            exemplo(
              'Exemplo 17 - LimitedBox limita quando o filho quer infinito',
              UnconstrainedBox(
                child: LimitedBox(
                  maxWidth: 100,
                  child: Container(
                    color: Colors.red,
                    width: double.infinity,
                    height: 100,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget exemplo(String titulo, Widget widget) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(titulo, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Container(height: 180, color: Colors.grey.shade200, child: widget),
        ],
      ),
    );
  }
}
