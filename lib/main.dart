import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class FormularioTransferencia extends StatelessWidget {
  const FormularioTransferencia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const <Widget>[
          CamposValores('Valor', '000,00' ),
          CamposValores('Conta', '00000'),

         ElevatedButton(onPressed: null, child: Text('Confirmar')),
        ],
      ),
      appBar: AppBar(
        title: Text('Criando Transferência'),
        elevation: 5,
        centerTitle: true,
        foregroundColor: Colors.amber,
        backgroundColor: Colors.black,
      ),
    );
  }
}

class CamposValores extends StatelessWidget {
  final String labelInfo;
  final String hintInfo;

  const CamposValores(
    this.labelInfo,
    this.hintInfo, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 5),
      child: TextField(
        style: TextStyle(
          fontSize: 24.0,
          color: Colors.blue,
        ),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          icon: Icon(Icons.monetization_on),
          labelText: labelInfo,
          hintText: hintInfo,
        ),
      ),
    );
  }
}

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transferências'),
      ),
      body: Column(
        children: [
          ItemTransferencia(Transferencia(100.00, 1)),
          ItemTransferencia(Transferencia(200.00, 1)),
          ItemTransferencia(Transferencia(300.00, 2)),
        ],
      ),
      floatingActionButton: const FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _tranferencia;

  const ItemTransferencia(this._tranferencia, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(_tranferencia.valor.toString()),
      subtitle: Text(_tranferencia.numeroConta.toString()),
    ));
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);
}
