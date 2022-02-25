class UsuarioModelo {
  final nombres, apellidos, cedula;

  UsuarioModelo({this.nombres, this.apellidos, this.cedula});

  // datos a json
  Map<String, dynamic> toJson() =>
      {'nombres': nombres, 'apellidos': apellidos, 'cedula': cedula};

  //json a datos
  factory UsuarioModelo.fromJson(Map<String, dynamic> data) => UsuarioModelo(
      apellidos: data['apellidos'],
      nombres: data['nombres'],
      cedula: data['cedula']);
}
