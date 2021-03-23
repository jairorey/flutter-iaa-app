import 'package:flutter/material.dart';
import 'package:iaa/helpers/mostrar_alerta.dart';
import 'package:iaa/services/auth_service.dart';
import 'package:iaa/widgets/btn_success.dart';
import 'package:iaa/widgets/custom_input.dart';
import 'package:iaa/widgets/label_widget.dart';
import 'package:iaa/widgets/logo_widget.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
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
                  text: 'Messenger',
                ),
                _Form(),
                Labels(
                  pregunta: '¿No tienes cuenta?',
                  respuesta: 'Crea una ahora',
                  ruta: 'register',
                ),
                Text(
                  'Terminos y Condiciones de Uso',
                )
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
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
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
              text: 'Ingrese',
              onPressed: authService.autenticando
                  ? null
                  : () async {
                      FocusScope.of(context).unfocus();
                      final loginOk = await authService.login(
                          emailCtrl.text.trim(), passwordCtrl.text.trim());
                      if (loginOk) {
                        //TODO: Conectar a nuestro server token
                        Navigator.pushReplacementNamed(context, 'usuarios');
                      } else {
                        print('si llega');
                        mostrarAlerta(context, 'Login incorrecto',
                            'Revise sus credenciales nuevamente');
                      }
                    }),
        ],
      ),
    );
  }
}
