import 'package:flutter/material.dart';
import 'package:iaa/widgets/btn_success.dart';
import 'package:iaa/widgets/custom_input.dart';
import 'package:iaa/widgets/label_widget.dart';
import 'package:iaa/widgets/logo_widget.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Logo(
                  text: 'Registro',
                ),
                _Form(),
                Labels(
                  pregunta: 'Ya estás Registrado?',
                  respuesta: 'Inicia aquí',
                  ruta: 'login',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  @override
  __formState createState() => __formState();
}

// ignore: camel_case_types
class __formState extends State<_Form> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.perm_identity,
            placeholder: 'Nombre',
            inputType: TextInputType.name,
            textController: nameCtrl,
          ),
          CustomInput(
            icon: Icons.email_outlined,
            placeholder: 'Correo Electrónico',
            inputType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Contraseña',
            isPassword: true,
            textController: passwordCtrl,
          ),
          BtnSuccess(
              text: 'Crear',
              onPressed: () {
                print(emailCtrl.text);
                print(passwordCtrl.text);
              })
        ],
      ),
    );
  }
}
