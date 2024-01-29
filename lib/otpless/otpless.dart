import 'package:flutter/material.dart';
import 'package:otpless_flutter/otpless_flutter.dart';

class OtpLessLogin extends StatefulWidget {
  const OtpLessLogin({Key? key}) : super(key: key);

  @override
  State<OtpLessLogin> createState() => _OtpLessLoginState();
}

class _OtpLessLoginState extends State<OtpLessLogin> {
  final _otplessFlutterPlugin = Otpless();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            var extra = {
              "method": "get",
              "params": {"cid": "Q9KY5S6RSAMYFYVQ3U6T2PTSIPH2674A"}
            };

            _otplessFlutterPlugin.openLoginPage((result) {
              var message = "";
              if (result['data'] != null) {
                final token = result['data']['token'];
                message = "token: $token";
                print(token);
              } else {
                message = result['errorMessage'];
              }
              // Handle the result or update UI accordingly

              // Hide the OTPLESS Sign In floating button after successful Sign In
              _otplessFlutterPlugin.signInCompleted();
            }, jsonObject: extra);
          },
          child: const Text('Sign-in'),
        ),
      ),
    );
  }
}
