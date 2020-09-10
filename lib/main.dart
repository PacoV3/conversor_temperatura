import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor de Farenheit a Celsius',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Conversor(title: 'Conversor de Farenheit a Celsius'),
    );
  }
}

class Conversor extends StatefulWidget {
  Conversor({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ConversorState createState() => _ConversorState();
}

class _ConversorState extends State<Conversor> {
  String _output;
  final inputControler = TextEditingController();

  void _calculateTemp() {
    setState(() {
      double farenheit = double.parse(inputControler.text);
      double celsius = (farenheit - 32) * 5 / 9;
      _output = '$celsius';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // widget hace referencia al código de la clase Conversor en otras palabras a su widget
        title: Text(widget.title),
      ),
      body: Center(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // Array de widgets que vamos a utilizar
            children: [
              TextFormField(
                controller: inputControler,
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: RaisedButton(
                  onPressed: () {
                    _calculateTemp();
                  },
                  child: Text('Convertir'),
                ),
              ),
              Text('$_output'.substring(0, 4 + '$_output'.indexOf('.')))
            ],
          ),
        ),
      ),
    );
  }
}
