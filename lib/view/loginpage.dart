import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm/res/components/rounded_button.dart';
import 'package:flutter_provider_mvvm/utils/custom_toast.dart';
import 'package:flutter_provider_mvvm/utils/utils.dart';
import 'package:flutter_provider_mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  var emailFocus = FocusNode();
  var passFocus = FocusNode();

  ValueNotifier<bool> passNotifier = ValueNotifier<bool>(true);

  @override
  void dispose() {
    _emailController.dispose();
    passNotifier.dispose();
    emailFocus.dispose();
    passFocus.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final _authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              focusNode: emailFocus,
              onFieldSubmitted: (_) {
                Utils.changeFocus(context, emailFocus, passFocus);
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                prefixIcon: const Icon(Icons.person),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ValueListenableBuilder(
                valueListenable: passNotifier,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: _passController,
                    focusNode: passFocus,
                    obscureText: passNotifier.value,
                    obscuringCharacter: "*",
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon:IconButton(
                          icon: Icon(passNotifier.value? Icons.visibility_off : Icons.visibility),
                          onPressed: () {
                            passNotifier.value = !passNotifier.value;
                          },
                        ) 
                      ),
                  );
                }),
            const SizedBox(
              height: 30,
            ),
            AppRoundedButton(onTap: (){
              if(!Utils.isValidEmail(_emailController.text.toString().trim()))
              {
                CustomToast(context: context, message: "Not a valid Email");
              }
              else if(_passController.text.toString().trim().length < 6)
              {
                CustomToast(context: context, message: "Password must be greater than 6 digit");
              }
              else
              {

                // Pass: cityslicka
                // Emails: eve.holt@reqres.in , george.bluth@reqres.in

                String email = _emailController.text.toString().trim();
                String pass = _passController.text.toString().trim();
                dynamic data = {
                  "email": email,
                  "password": pass
                };

                _authViewModel.loginAPI(data, context);

              }
            }, title: "Login", loading: AuthViewModel().isLoading,),
          ],
        ),
      ),
    );
  }
}
