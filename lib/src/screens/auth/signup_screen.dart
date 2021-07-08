
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:places/src/api/auth_api.dart';
import 'package:places/src/screens/dashboard/dashboard_screen.dart';
import 'package:places/src/utils/snackbar_helper.dart';
import 'package:places/src/viewmodels/login_view_model.dart';
import 'package:places/src/viewmodels/signup_view_model.dart';
import 'package:places/src/widgets/custom_app_bar.dart';
import 'package:places/src/widgets/input_email.dart';
import 'package:places/src/widgets/input_name.dart';
import 'package:places/src/widgets/input_password.dart';
import 'package:places/src/widgets/input_phone.dart';
import 'package:places/src/widgets/shared/app_colors.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController _emailController =
      TextEditingController(text: "gmail@email.com");
  final TextEditingController _passwordController =
      TextEditingController(text: "password");
  final TextEditingController _nameController =
      TextEditingController(text: "Ram Kumar Shrestha");
  final TextEditingController _phoneController =
      TextEditingController(text: "9857983433");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: blackColor87,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        context: context,
        subTitle: "Create your \n account",
      ),
      body:  ChangeNotifierProvider.value(
        value : SignupViewModel(),
        child: Consumer(
          builder: (context, SignupViewModel model, child) {
            return Column(
                    children: <Widget>[
                      Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            SizedBox(height: 24),
                            InputName(controller: _nameController),
                            InputPhone(controller: _phoneController),
                            InputEmail(controller: _emailController),
                            InputPassword(controller: _passwordController),
                            _buildSubmitButton(context, model),
                            SizedBox(height: 12),
                            _buildTermsAndConditions(context),
                            SizedBox(height: 12),
                          ],
                        ),
                      ),
                      _buildSignInSection(context)
                    ],
                  );
          }
        ),
      ),
    );
  }

  Widget _buildTermsAndConditions(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              style: TextStyle(color: primaryColor, height: 1.5),
              children: [
                TextSpan(
                    text: 'By continuing, you agree to our\n ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(
                  style: TextStyle(color: primaryColor),
                  children: [
                    TextSpan(
                        text: 'Terms and conditions ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: blueColor,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print("Terms and conditions clicked");
                          }),
                    TextSpan(
                      text: ' and ',
                    ),
                    TextSpan(
                        text: "Privacy Policy",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: blueColor,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print("Privacy policy clicked");
                          })
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context, SignupViewModel model) {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: ButtonTheme(
        minWidth: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: BorderSide.none),
            padding: EdgeInsets.all(18.0),
            primary: primaryColor,
          ),
          onPressed: model.busy ? null : () {
                  _onSubmit(context, model);
                },
          child: model.busy ? CircularProgressIndicator() : Text("Submit"),
        ),
      ),
    );
  }

  Future _onSubmit(BuildContext context, SignupViewModel model) async {
    final response =
    await model.register(_nameController.text,_phoneController.text,
        _emailController.text, _passwordController.text);
    if (response.status) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return DashboardScreen();
      }));
    } else {
      showSnackBar(context, response.message!);
    }
  }

  Widget _buildSignInSection(BuildContext context) {
    return Column(
      children: [
        Divider(),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Alreay have an account?"),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Login"),
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(color: primaryColor)),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              ),
            )
          ],
        ),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
