import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController? controlador;
  final String? rotulo;
  final String? dica;
  final IconData? icone;

  const Editor({Key? key,
    this.controlador,
    this.rotulo,
    this.dica,
    this.icone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
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
