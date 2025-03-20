import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const ContadorApp());
}

class ContadorApp extends StatefulWidget {
  const ContadorApp({super.key});

  @override
  State<ContadorApp> createState() => _ContadorPessoasState();
}

class _ContadorPessoasState extends State<ContadorApp> {
  int _contador = 0;
  int _limite = 10;
  bool _modoNoturno = false;
  Color _corFundo = Colors.grey[200]!;
  final TextEditingController _limiteController = TextEditingController();
  final List<Color> _coresDisponiveis = [
    Colors.white,
    Colors.blueGrey,
    Colors.lightBlue,
    Colors.lightGreen,
    Colors.amberAccent,
  ];

  void _incrementar() {
    setState(() {
      _contador++;
    });
  }

  void _decrementar() {
    setState(() {
      if (_contador > 0) {
        _contador--;
      }
    });
  }

  void _alternarModo() {
    setState(() {
      _modoNoturno = !_modoNoturno;
    });
  }

  void _atualizarLimite() {
    setState(() {
      _limite = int.tryParse(_limiteController.text) ?? 10;
    });
  }

  void _mudarCorFundo() {
    setState(() {
      _corFundo = _coresDisponiveis[Random().nextInt(_coresDisponiveis.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: _modoNoturno ? Brightness.dark : Brightness.light,
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: _corFundo,
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            color: _modoNoturno ? Colors.white : Colors.black,
          ),
          bodyMedium: TextStyle(
            color: _modoNoturno ? Colors.white70 : Colors.black87,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Contador de Pessoas'),
          centerTitle: true,
          backgroundColor: Colors.teal,
          actions: [
            IconButton(
              icon: Icon(_modoNoturno ? Icons.dark_mode : Icons.light_mode),
              onPressed: _alternarModo,
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Pessoas',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    Text(
                      '$_contador',
                      style: const TextStyle(
                        fontSize: 72,
                        fontWeight: FontWeight.bold,
                        color: Colors.orangeAccent,
                      ),
                    ),
                    Text(
                      'Limite: $_limite',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    if (_contador > _limite)
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Limite excedido!',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 120,
                      child: TextField(
                        controller: _limiteController,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: 'Novo Limite',
                          labelStyle: TextStyle(color: Colors.teal),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _atualizarLimite,
                      child: const Text('Confirmar Limite'),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: _incrementar,
                          icon: const Icon(
                            Icons.arrow_upward,
                            color: Colors.white70,
                          ),
                          label: const Text(
                            '+1',
                            style: TextStyle(color: Colors.white70),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                            backgroundColor: Colors.teal,
                          ),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton.icon(
                          onPressed: _decrementar,
                          icon: const Icon(
                            Icons.arrow_downward,
                            color: Colors.white70,
                          ),
                          label: const Text(
                            '-1',
                            style: TextStyle(color: Colors.white70),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                            backgroundColor: Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _mudarCorFundo,
                      child: const Text('Mudar Cor de Fundo'),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              color: Colors.teal,
              width: double.infinity,
              child: const Text(
                'Desenvolvido por Matheus Cordeiro e Vitor Saar',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
