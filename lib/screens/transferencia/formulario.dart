import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';
import '../../components/editor.dart';

const _tituloAppBar = 'Criando Transferências';
const _rotuloCampoConta = 'Número da Conta';
const _rotuloCampoValor = 'Valor';
const _dicaCampoConta = '000';
const _dicaCampoValor = '000.00';
const _botaoConfirmar  = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  const FormularioTransferencia({Key? key}) : super(key: key);

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
                rotulo: _rotuloCampoConta,
                dica: _dicaCampoConta),
            Editor(
                controlador: _controladorCampoValor,
                rotulo: _rotuloCampoValor,
                dica: _dicaCampoValor,
                icone: Icons.monetization_on),

            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                _criaTransferencia(context);
              },
              child: const Text(_botaoConfirmar),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text(_tituloAppBar),
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
      //debugPrint('$transferenciaCriada');
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