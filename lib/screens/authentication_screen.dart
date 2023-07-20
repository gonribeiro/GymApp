import 'package:flutter/material.dart';
import 'package:gymapp/_common/app_color.dart';
import 'package:gymapp/_components/input_decoration.dart';
import 'package:gymapp/services/authentication_service.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  bool authenticated = true;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final AuthenticationService _authenticationService = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.blue,
                  AppColors.lightBlue
                ],
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset("assets/astroboy.jpg", height: 128),
                      const Text(
                        "GymApp",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                      const SizedBox(height: 32),
                      TextFormField(
                        controller: _emailController,
                        decoration: getInputDecoration("E-mail"),
                        validator: (String? value) {
                          if (value == null) {
                            return "E-mail é obrigatório";
                          }

                          if (!value.contains("@") || !value.contains(".")) {
                            return "E-mail não é válido";
                          }

                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _passwordController,
                        decoration: getInputDecoration("Senha"),
                        obscureText: true,
                        validator: (String? value) {
                          if (value == null) {
                            return "Senha é obrigatório";
                          }

                          if (value.length < 2) {
                            return "A senha não é válida";
                          }

                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      Visibility(visible: !authenticated, child: Column(
                        children: [
                          // TextFormField(
                          //   decoration: getInputDecoration("Confirmar Senha"),
                          //   obscureText: true,
                          //   validator: (String? value) {
                          //     if (value == null) {
                          //       return "Senha é obrigatório";
                          //     }

                          //     if (value.length < 2) {
                          //       return "As senhas não coincidem";
                          //     }

                          //     return null;
                          //   },
                          // ),
                          // const SizedBox(height: 8),
                          TextFormField(
                            controller: _nameController,
                            decoration: getInputDecoration("Nome"),
                            validator: (String? value) {
                              if (value == null) {
                                return "Nome é obrigatório";
                              }

                              if (value.length < 3) {
                                return "Nome não atende aos requisitos";
                              }

                              return null;
                            },
                          ),
                          const SizedBox(height: 8),
                        ],
                      )),
                      const SizedBox(height: 16),
                      ElevatedButton(onPressed: () {
                        setState(() {
                          handleLogin();
                        });
                      },
                        child: Text((authenticated) ? "Entrar" : "Cadastrar")
                      ),
                      const Divider(),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            authenticated = !authenticated;
                          });
                        },
                        child: Text(
                          (authenticated)
                          ? "Não possui conta? Cadastre-se!"
                          : "Fazer Login"
                        )
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      )
    );
  }

  handleLogin() {
    String email = _emailController.text;
    String password = _passwordController.text;
    String name = _nameController.text;

    if (_formKey.currentState!.validate()) {
      if (!authenticated) {
        _authenticationService.createUser(
          email: email,
          password: password,
          name: name
        );
      } else {
        print("Form Valid");
      }
    } else {
      print("Form invalid");
    }
  }
}