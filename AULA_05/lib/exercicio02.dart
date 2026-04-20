import 'package:flutter/material.dart';

void main() {
  runApp(const ResponsiveExerciseApp());
}

class ResponsiveExerciseApp extends StatelessWidget {
  const ResponsiveExerciseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exercicio 2 - Responsividade',
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          brightness: Brightness.dark,
        ),
      ),
      home: const ResponsiveLayoutsPage(),
    );
  }
}

class ResponsiveLayoutsPage extends StatelessWidget {
  const ResponsiveLayoutsPage({super.key});

  static const languages = ['Dart', 'JavaScript', 'PHP', 'C++'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Responsive Layouts'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1, color: Colors.white38),
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final wide = constraints.maxWidth >= 720;
            final controls = const _HeaderAndButtons();
            final list = const _LanguageList(languages: languages);

            if (wide) {
              return Row(
                children: [
                  Expanded(child: Center(child: controls)),
                  const VerticalDivider(width: 1, color: Colors.white38),
                  Expanded(child: Center(child: list)),
                ],
              );
            }

            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 420),
                child: Column(
                  children: [
                    const SizedBox(height: 32),
                    controls,
                    const SizedBox(height: 22),
                    Expanded(child: list),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _HeaderAndButtons extends StatelessWidget {
  const _HeaderAndButtons();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Cheetah Coding',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 26),
          LayoutBuilder(
            builder: (context, constraints) {
              final stackButtons = constraints.maxWidth >= 360;
              final buttons = [
                Expanded(
                  child: _PlainButton(
                    text: 'BUTTON 1',
                    onPressed: () => _showMessage(context, 'Button 1'),
                  ),
                ),
                const SizedBox(width: 44, height: 14),
                Expanded(
                  child: _PlainButton(
                    text: 'BUTTON 2',
                    onPressed: () => _showMessage(context, 'Button 2'),
                  ),
                ),
              ];

              if (stackButtons) {
                return Row(children: buttons);
              }

              return Column(
                children: [
                  SizedBox(width: double.infinity, child: buttons[0]),
                  const SizedBox(height: 14),
                  SizedBox(width: double.infinity, child: buttons[2]),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  void _showMessage(BuildContext context, String button) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('$button pressionado')));
  }
}

class _PlainButton extends StatelessWidget {
  const _PlainButton({required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        shape: const RoundedRectangleBorder(),
        fixedSize: const Size.fromHeight(48),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

class _LanguageList extends StatelessWidget {
  const _LanguageList({required this.languages});

  final List<String> languages;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: languages.length,
      separatorBuilder: (context, index) {
        return const Divider(height: 1, thickness: 1, color: Colors.white38);
      },
      itemBuilder: (context, index) {
        return SizedBox(
          height: 72,
          child: Center(
            child: Text(
              languages[index],
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
            ),
          ),
        );
      },
    );
  }
}
