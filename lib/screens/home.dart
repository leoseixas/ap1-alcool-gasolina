import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();

  String _textoResultado = "";

  void _Calcular() {
    double precoAlcool = double.tryParse(_controllerAlcool.text);
    double precoGasolina = double.tryParse(_controllerGasolina.text);

    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _textoResultado =
            'Número invalido, digite número maior que 0 e utilizando (.)';
      });
    } else {
      if ((precoAlcool / precoGasolina >= 0.7)) {
        setState(() {
          _textoResultado = 'Melhor abastecer com gasolina';
        });
      } else {
        setState(() {
          _textoResultado = 'Melhor abastecer com Àlcool';
        });
      }
    }
    limparCampo();
  }

  void limparCampo(){
    _controllerGasolina.text = "";
    _controllerAlcool.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Àlcool ou Gasolina'),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  'Sabia qual a melhor opção de combustível',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                controller: _controllerAlcool,
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(labelText: "Preço do Alcool, ex 1.59"),
                style: TextStyle(fontSize: 18),
              ),
              TextField(
                controller: _controllerGasolina,
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(labelText: "Preço do Gasolina, ex 1.59"),
                style: TextStyle(fontSize: 18),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: RaisedButton(
                    child: Text(
                      'Calcular',
                      style: TextStyle(fontSize: 18),
                    ),
                    color: Colors.lightBlueAccent[200],
                    textColor: Colors.white,
                    padding: EdgeInsets.all(15),
                    onPressed: _Calcular,
                )
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _textoResultado,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
