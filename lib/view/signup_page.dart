import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../res/components/rounded_button.dart';
import '../utils/custom_toast.dart';
import '../utils/routes/route_name.dart';
import '../utils/utils.dart';
import '../view_model/auth_view_model.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
                _authViewModel.signupAPI(data, context);
              }
            }, title: "SignUp", loading: _authViewModel.isLoading,),
            const SizedBox(
              height: 30,
            ),

            // Goto Signup Page
            InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child:const Text("Already have an account? LogIn", ))
          ],
        ),
      ),
    );
  }
}
