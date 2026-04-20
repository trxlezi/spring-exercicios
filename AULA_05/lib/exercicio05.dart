import 'package:flutter/material.dart';

void main() {
  runApp(const BottomAppBarFabExerciseApp());
}

class BottomAppBarFabExerciseApp extends StatelessWidget {
  const BottomAppBarFabExerciseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exercicio 5 - BottomAppBar com FAB',
      theme: ThemeData(useMaterial3: false, primarySwatch: Colors.blue),
      home: const BottomAppBarWithFabPage(),
    );
  }
}

class BottomAppBarWithFabPage extends StatefulWidget {
  const BottomAppBarWithFabPage({super.key});

  @override
  State<BottomAppBarWithFabPage> createState() =>
      _BottomAppBarWithFabPageState();
}

class _BottomAppBarWithFabPageState extends State<BottomAppBarWithFabPage> {
  int _selectedIndex = 2;
  bool _showFabOptions = false;

  static const _tabs = [
    _BottomTab(icon: Icons.menu, label: 'This'),
    _BottomTab(icon: Icons.layers, label: 'Is'),
    _BottomTab(icon: Icons.dashboard, label: 'Bottom'),
    _BottomTab(icon: Icons.info, label: 'Bar'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BottomAppBar with FAB')),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Center(
            child: Text(
              'TAB: ${_selectedIndex + 1}',
              style: const TextStyle(fontSize: 34, letterSpacing: 2),
            ),
          ),
          _FabOptions(
            visible: _showFabOptions,
            onSelected: (label) {
              setState(() => _showFabOptions = false);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Opcao selecionada: $label')),
              );
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() => _showFabOptions = !_showFabOptions);
        },
        child: AnimatedRotation(
          turns: _showFabOptions ? 0.125 : 0,
          duration: const Duration(milliseconds: 180),
          child: const Icon(Icons.add),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        child: SizedBox(
          height: 64,
          child: Row(
            children: [
              _BottomAppBarItem(
                tab: _tabs[0],
                selected: _selectedIndex == 0,
                onTap: () => _selectTab(0),
              ),
              _BottomAppBarItem(
                tab: _tabs[1],
                selected: _selectedIndex == 1,
                onTap: () => _selectTab(1),
              ),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 32),
                  child: Text(
                    'A',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
              ),
              _BottomAppBarItem(
                tab: _tabs[2],
                selected: _selectedIndex == 2,
                onTap: () => _selectTab(2),
              ),
              _BottomAppBarItem(
                tab: _tabs[3],
                selected: _selectedIndex == 3,
                onTap: () => _selectTab(3),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _selectTab(int index) {
    setState(() {
      _selectedIndex = index;
      _showFabOptions = false;
    });
  }
}

class _BottomTab {
  const _BottomTab({required this.icon, required this.label});

  final IconData icon;
  final String label;
}

class _BottomAppBarItem extends StatelessWidget {
  const _BottomAppBarItem({
    required this.tab,
    required this.selected,
    required this.onTap,
  });

  final _BottomTab tab;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected ? Theme.of(context).primaryColor : Colors.black54;

    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(tab.icon, color: color),
            const SizedBox(height: 4),
            Text(tab.label, style: TextStyle(color: color)),
          ],
        ),
      ),
    );
  }
}

class _FabOptions extends StatelessWidget {
  const _FabOptions({required this.visible, required this.onSelected});

  final bool visible;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    const options = [
      _FabOption(icon: Icons.chat_bubble, label: 'Mensagem'),
      _FabOption(icon: Icons.mail, label: 'Email'),
      _FabOption(icon: Icons.phone, label: 'Telefone'),
    ];

    return IgnorePointer(
      ignoring: !visible,
      child: AnimatedOpacity(
        opacity: visible ? 1 : 0,
        duration: const Duration(milliseconds: 180),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 84),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (final option in options)
                Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: FloatingActionButton.small(
                    heroTag: option.label,
                    onPressed: () => onSelected(option.label),
                    child: Icon(option.icon),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FabOption {
  const _FabOption({required this.icon, required this.label});

  final IconData icon;
  final String label;
}
