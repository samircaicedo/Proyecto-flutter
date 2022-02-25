import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taller/database/usuario_database.dart';
import 'package:taller/modelo_datos/usuario_modelo.dart';

class Formulario extends StatefulWidget {
  const Formulario({Key? key}) : super(key: key);

  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> with UsuarioDatabase {
  TextEditingController nombre = TextEditingController();
  TextEditingController apellido = TextEditingController();
  TextEditingController cedula = TextEditingController();
  GlobalKey<FormState> form = GlobalKey<FormState>();
  SingingCharacter? _character = SingingCharacter.none;
  bool stateUpdate = true;

  Padding input({TextEditingController? inputData, String? label}) {
    return label == 'Cedula'
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: inputData,
              decoration: InputDecoration(
                  label: Text(label!), border: OutlineInputBorder()),
              enabled: stateUpdate,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'El $label esta vacio';
                } else {
                  return null;
                }
              },
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(

              controller: inputData,
              decoration: InputDecoration(
                  label: Text(label!), border: OutlineInputBorder()),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'El $label esta vacio';
                } else {
                  return null;
                }
              },
              onChanged: (text){
                print(text.length);
                if(text.length == 0){
                  setState(() {
                    stateUpdate = true;
                  });
                }
              },
            ),
          );
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario'),
      ),
      body: Column(
        children: [
          Form(
            key: form,
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                input(label: 'Nombre o Nombres', inputData: nombre),
                input(label: 'Apellido o Apellidos', inputData: apellido),
                input(label: 'Cedula', inputData: cedula),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: const Text('Mujer'),
                        leading: Radio<SingingCharacter>(
                          value: SingingCharacter.mujer,
                          groupValue: _character,
                          onChanged: (SingingCharacter? value) {
                            setState(() {
                              _character = value;
                            });
                            print(value);
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: const Text('Hombre'),
                        leading: Radio<SingingCharacter>(
                          value: SingingCharacter.hombre,
                          groupValue: _character,
                          onChanged: (SingingCharacter? value) {
                            setState(() {
                              _character = value;
                            });
                            print(value);
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: const Text('Otros'),
                        leading: Radio<SingingCharacter>(
                          value: SingingCharacter.others,
                          groupValue: _character,
                          onChanged: (SingingCharacter? value) {
                            setState(() {
                              _character = value;
                            });
                            print(value);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton.icon(
                        onPressed: !stateUpdate ? null : () {
                          if (form.currentState!.validate()) {
                            saveUsuario(
                                data: UsuarioModelo(
                                        cedula: cedula.text,
                                        nombres: nombre.text,
                                        apellidos: apellido.text)
                                    .toJson());
                          }
                        },
                        icon: const Icon(Icons.save),
                        label: const Text('Guardar')),
                    ElevatedButton.icon(
                        onPressed: () {
                          if (form.currentState!.validate()) {
                            updateUser(
                                data: UsuarioModelo(
                                        cedula: cedula.text,
                                        nombres: nombre.text,
                                        apellidos: apellido.text)
                                    .toJson());
                          }
                        },
                        icon: const Icon(Icons.save),
                        label: const Text('Editar'))
                  ],
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5)),
            child: StreamBuilder<List<UsuarioModelo>>(
                stream: listaUsuarios(),
                builder: (context, datos) {
                  if (datos.hasError) {
                    return Center(
                      child: Text(datos.error.toString()),
                    );
                  }

                  if (datos.hasData) {
                    return ListView.separated(
                        itemBuilder: (context, index) {
                          UsuarioModelo datosUsuario = datos.data![index];
                          return ListTile(
                            onTap: () {
                              setState(() {
                                nombre = TextEditingController(
                                    text: datosUsuario.nombres);
                                apellido = TextEditingController(
                                    text: datosUsuario.apellidos);
                                cedula = TextEditingController(
                                    text: datosUsuario.cedula);
                                stateUpdate = false;
                              });
                            },
                            title: Text(
                                '${datosUsuario.nombres} ${datosUsuario.apellidos}'),
                            subtitle: Text(datosUsuario.cedula),
                            trailing: IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () {
                                borrarUsuario(id: datosUsuario.cedula)
                                    .then((value) => print(value));
                              },
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: datos.data!.length);
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ))
        ],
      ),
    );
  }
}

enum SingingCharacter { mujer, hombre, others, none }
