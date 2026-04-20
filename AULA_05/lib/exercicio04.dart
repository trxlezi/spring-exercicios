import 'package:flutter/material.dart';

void main() {
  runApp(const FormExerciseApp());
}

class FormExerciseApp extends StatelessWidget {
  const FormExerciseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exercicio 4 - Form',
      theme: ThemeData(useMaterial3: false, primarySwatch: Colors.blue),
      home: const FlutterFormDemoPage(),
    );
  }
}

class FlutterFormDemoPage extends StatefulWidget {
  const FlutterFormDemoPage({super.key});

  @override
  State<FlutterFormDemoPage> createState() => _FlutterFormDemoPageState();
}

class _FlutterFormDemoPageState extends State<FlutterFormDemoPage> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _dobController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Form Demo')),
      body: Column(
        children: [
          _InputRow(
            icon: Icons.person,
            hintText: 'Name',
            controller: _nameController,
            keyboardType: TextInputType.name,
          ),
          _InputRow(
            icon: Icons.phone,
            hintText: 'Phone',
            controller: _phoneController,
            keyboardType: TextInputType.phone,
          ),
          _InputRow(
            icon: Icons.calendar_today,
            hintText: 'Dob',
            controller: _dobController,
            readOnly: true,
            onTap: _pickDate,
          ),
          const SizedBox(height: 28),
          Center(
            child: ElevatedButton(
              onPressed: _submit,
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final selected = await showDatePicker(
      context: context,
      initialDate: DateTime(now.year - 18, now.month, now.day),
      firstDate: DateTime(1900),
      lastDate: now,
    );

    if (selected == null) {
      return;
    }

    _dobController.text =
        '${selected.day.toString().padLeft(2, '0')}/'
        '${selected.month.toString().padLeft(2, '0')}/'
        '${selected.year}';
  }

  void _submit() {
    final name = _nameController.text.trim();
    final phone = _phoneController.text.trim();
    final dob = _dobController.text.trim();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Nome: ${name.isEmpty ? '-' : name} | '
          'Telefone: ${phone.isEmpty ? '-' : phone} | '
          'Nascimento: ${dob.isEmpty ? '-' : dob}',
        ),
      ),
    );
  }
}

class _InputRow extends StatelessWidget {
  const _InputRow({
    required this.icon,
    required this.hintText,
    required this.controller,
    this.keyboardType,
    this.readOnly = false,
    this.onTap,
  });

  final IconData icon;
  final String hintText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool readOnly;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFE0E0E0))),
      ),
      child: Row(
        children: [
          const SizedBox(width: 12),
          Icon(icon, size: 18, color: Colors.black54),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: keyboardType,
              readOnly: readOnly,
              onTap: onTap,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
