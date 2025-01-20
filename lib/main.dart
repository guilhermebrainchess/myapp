import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Calculadora(),
        ),
      ),
    );
  }
}

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String _entrada = "0";
  double _numero1 = 0;
  String _operador = "";

  void _pressionarBotao(String valor) {
    setState(() {
      if (valor == "C") {
        _entrada = "0";
        _numero1 = 0;
        _operador = "";
      } else if (valor == "=") {
        if (_operador == "+") {
          _entrada = (_numero1 + double.parse(_entrada)).toString();
        } else if (_operador == "-") {
          _entrada = (_numero1 - double.parse(_entrada)).toString();
        } else if (_operador == "*") {
          _entrada = (_numero1 * double.parse(_entrada)).toString();
        } else if (_operador == "/") {
          _entrada = double.parse(_entrada) != 0
              ? (_numero1 / double.parse(_entrada)).toString()
              : "Erro";
        }
        _operador = "";
      } else if (valor == "+" || valor == "-" || valor == "*" || valor == "/") {
        _numero1 = double.parse(_entrada);
        _operador = valor;
        _entrada = "0";
      } else {
        if (_entrada == "0") {
          _entrada = valor;
        } else {
          _entrada += valor;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Título centralizado no meio
        Text(
          "Calculadora",
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Text(
          _entrada,
          style: TextStyle(fontSize: 48),
        ),
        SizedBox(height: 20),
        // Botões
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildBotao("1"),
            _buildBotao("2"),
            _buildBotao("3"),
            _buildBotao("+"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildBotao("4"),
            _buildBotao("5"),
            _buildBotao("6"),
            _buildBotao("-"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildBotao("7"),
            _buildBotao("8"),
            _buildBotao("9"),
            _buildBotao("*"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildBotao("0"),
            _buildBotao("C"),
            _buildBotao("="),
            _buildBotao("/"),
          ],
        ),
      ],
    );
  }

  Widget _buildBotao(String valor) {
    return SizedBox(
      width: 70,
      height: 70,
      child: ElevatedButton(
        onPressed: () => _pressionarBotao(valor),
        child: Text(
          valor,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
