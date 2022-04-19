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