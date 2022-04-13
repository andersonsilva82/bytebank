import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        body: ListaTransferencias(),
        appBar: AppBar(
          title: const Text('Transferências'),
        ),
        floatingActionButton: const FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: null,
        ),
      ),
    ));

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemTransferencia(Transferencia(100.00,1)),
        ItemTransferencia(Transferencia(200.00,1)),
        ItemTransferencia(Transferencia(300.00,2)),
      ],
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _tranferencia;

  const ItemTransferencia(this._tranferencia, {Key? key})
      : super(key: key);

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