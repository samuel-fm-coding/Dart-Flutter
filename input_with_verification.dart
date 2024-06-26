import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Input via Teclado',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InputScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entrada de Dados'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: 'Digite seu primeiro nome...',
                labelText: 'Nome',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _submitForm(context);
              },
              child: Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm(BuildContext context) {
    String inputText = _textEditingController.text.trim();

    if (inputText.isEmpty) {
      _showAlertDialog(context, 'Erro', 'Por favor, digite algo!');
    } else {
      _showAlertDialog(context, 'Sucesso', 'Bem-vindo(a), $inputText !!!');
      // Limpar o campo de texto após a submissão bem-sucedida
      _textEditingController.clear();
    }
  }

  void _showAlertDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
