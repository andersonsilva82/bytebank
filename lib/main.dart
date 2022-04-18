import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
        ).copyWith(
          secondary: Colors.red,

        ),
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.purple),
        ),
      ),
      home: ListaTransferencias(),
    );
  }
}

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciaState();
  }
}

class ListaTransferenciaState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transferências'),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));

          future.then((transferenciaRecebida) {
            Future.delayed(Duration(seconds: 1), () {
              setState(() {
                if (transferenciaRecebida != null) {
                  widget._transferencias.add(transferenciaRecebida);

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Transferência Realizada!'),
                    duration: const Duration(seconds: 2),
                    action: SnackBarAction(
                      label: '',
                      onPressed: () {},
                    ),
                  ));
                } else
                  debugPrint('Nada foi alterado');
              });
            });
          });
        },
      ),
    );
  }
}

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
                controlador: _controladorCampoNumeroConta,
                rotulo: 'Conta',
                dica: '000'),
            Editor(
                controlador: _controladorCampoValor,
                rotulo: 'Valor',
                dica: '000.00',
                icone: Icons.monetization_on),

            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                _criaTransferencia(context);
              },
              child: Text('Confirmar'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Criando Transferência'),
        elevation: 5,
        centerTitle: true,
        //foregroundColor: Colors.lightBlue,
        //backgroundColor: Colors.black,
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final valor = double.tryParse(_controladorCampoValor.value.text);
    final numeroConta = int.tryParse(_controladorCampoNumeroConta.text);

    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      debugPrint('Recebido do Then');
      debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);

      /// Mensagem de Alerta de OK
      /*ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('$transferenciaCriada'),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: '',
          onPressed: () {},
        ),
      ));*/
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController? controlador;
  final String? rotulo;
  final String? dica;
  final IconData? icone;

  const Editor({this.controlador, this.rotulo, this.dica, this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 5),
      child: TextField(
        controller: controlador,
        style: const TextStyle(
          fontSize: 24.0,
          //color: Colors.red,
        ),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,

          ///verificação ternária
          labelText: rotulo,
          hintText: dica,
        ),
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
          onLongPress: () {
            print("tapped");
          },
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

  /// override do toString para mostrar no  debugPrint('$transferenciaCriada');
  @override
  String toString() {
    // TODO: implement toString
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}
