import 'package:flutter/material.dart';
import 'package:places/src/widgets/shared/app_colors.dart';

class InputPassword extends StatefulWidget {
  final TextEditingController controller;

  const InputPassword({Key? key, required this.controller}) : super(key: key);

  @override
  _InputPasswordState createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 12.0, top: 4.0),
              child: Text(
                "Your Password",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
              ),
            ),
            TextField(
              obscureText: _isPasswordVisible ? false : true,
              controller: widget.controller,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(_isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: blackColor87),
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(4.0),
                  ),
                ),
                hintText: "********",
              ),
            ),
          ],
        ));
  }
}
