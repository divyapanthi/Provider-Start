import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
 final String messages;
 final VoidCallback callback;
  const ErrorView({Key? key, required this.messages, required this.callback}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(messages,style: Theme.of(context).textTheme.headline6,),
          SizedBox(height: 12),
          TextButton(
              onPressed: () => callback(),
              child: Text("Retry"))
        ],
      ),
    );
  }
}
