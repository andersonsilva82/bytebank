import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class FormularioTransferencia extends StatelessWidget {

  final TextEditingController _controladorCampoNumeroConta =
  TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 5),
            child: TextField(
              controller: _controladorCampoValor,
              style: const TextStyle(
                fontSize: 24.0,
                color: Colors.blue,
              ),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Valor',
                hintText: '000,00',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 5),
            child: TextField(
              controller: _controladorCampoNumeroConta,
              style: const TextStyle(
                fontSize: 24.0,
                color: Colors.blue,
              ),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Conta',
                hintText: '0000',
                icon: Icon(Icons.monetization_on_rounded),
              ),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              final double valor = double.parse(_controladorCampoValor.value.text);
              final int numeroConta = int.parse(_controladorCampoNumeroConta.value.text);

              if (numeroConta != null && valor != null){
                final transferenciaCriada = Transferencia(valor, numeroConta);
                debugPrint('$transferenciaCriada');
              }
            },

            child: Text('Confirmar'),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text('Criando Transferência'),
        elevation: 5,
        centerTitle: true,
        foregroundColor: Colors.lightBlue,
        backgroundColor: Colors.black,
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

  @override
  String toString() {
    // TODO: implement toString
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}
