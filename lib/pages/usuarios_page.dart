import 'package:flutter/material.dart';
import 'package:iaa/models/usuario.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UsuariosPage extends StatefulWidget {
  @override
  _UsuariosPageState createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  final usuarios = [
    Usuario(uuid: '1', nombre: 'J4', email: 'j4@test.com', online: true),
    Usuario(
        uuid: '2', nombre: 'Pavito', email: 'pavito@test.com', online: true),
    Usuario(
        uuid: '3', nombre: 'Juistin', email: 'justino@test.com', online: true),
    Usuario(
        uuid: '4', nombre: 'Esquoc', email: 'esquok@test.com', online: true),
    Usuario(uuid: '5', nombre: 'Rivv', email: 'rivv@test.com', online: false),
    Usuario(
        uuid: '6', nombre: 'Oraclesor', email: 'gato@test.com', online: false),
    Usuario(uuid: '7', nombre: 'Svt', email: 'svt@test.com', online: true),
  ];

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.exit_to_app),
          color: Colors.black87,
          onPressed: () {},
        ),
        elevation: 1,
        title: Text(
          'Contactos',
          style: TextStyle(color: Colors.black87),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.check_circle_outline,
              color: Colors.blue,
            ),
          ),
        ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        child: _usuariosListView(),
        onRefresh: _onRefresh,
      ),
    );
  }

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  ListView _usuariosListView() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (_, i) => _usuarioListTile(usuarios[i]),
      separatorBuilder: (_, i) => Divider(),
      itemCount: usuarios.length,
    );
  }

  ListTile _usuarioListTile(Usuario usuario) {
    return ListTile(
      title: Text(usuario.nombre),
      leading: CircleAvatar(
        child: Text(
          usuario.nombre.substring(0, 2),
        ),
        backgroundColor: Colors.blue[100],
      ),
      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: usuario.online ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
