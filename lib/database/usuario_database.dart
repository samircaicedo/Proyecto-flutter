import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taller/modelo_datos/usuario_modelo.dart';

class UsuarioDatabase {
  Stream<List<UsuarioModelo>> listaUsuarios() => FirebaseFirestore.instance
      .collection('usuarios')
      .snapshots()
      .map((event) => event.docs.map<UsuarioModelo>((e) {
            // Map<String, dynamic> data = e.data();
            // data.putIfAbsent('id', () => e.id);

            return UsuarioModelo.fromJson(e.data());
          }).toList());

  Future<String> borrarUsuario({String? id}) async => FirebaseFirestore.instance
      .collection('usuarios')
      .doc(id)
      .delete()
      .then((value) => 'Item borrado');

  Future<String> saveUsuario({required Map<String, dynamic> data}) async =>
      FirebaseFirestore.instance
          .collection('usuarios')
          .doc(data['cedula'])
          .set(data)
          .then((value) => 'Usuario guardado');

  Future<String> updateUser({required Map<String, dynamic> data}) async =>
      FirebaseFirestore.instance
          .collection('usuarios')
          .doc(data['cedula'])
          .update(data)
          .then((value) => 'Usuario actualizado');
}
