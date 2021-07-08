import 'dart:math' as Math;

import 'package:flutter/material.dart';
import 'package:places/src/widgets/shared/app_colors.dart';

class InputEmail extends StatelessWidget {
  final TextEditingController controller;

  const InputEmail({Key? key, required this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 12.0),
              child: Text(
                "Your email",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
              ),
            ),
            TextField(
              controller: controller,
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
                prefixIcon: Container(
                    width: Math.min(MediaQuery.of(context).size.width / 6, 40),
                    decoration: BoxDecoration(
                        border: Border(right: BorderSide(color: greyColor))),
                    child: Text(
                      "@",
                      textAlign: TextAlign.center,
                    ),
                    padding: EdgeInsets.all(8),
                    alignment: Alignment.center),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: blackColor87, width: 1),
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(4.0),
                  ),
                ),
                hintText: "you@example.com",
              ),
            ),
          ],
        ));
  }
}
