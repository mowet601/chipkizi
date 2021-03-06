import 'package:chipkizi/models/main_model.dart';
import 'package:chipkizi/values/consts.dart';
import 'package:chipkizi/values/status_code.dart';
import 'package:chipkizi/values/strings.dart';
import 'package:chipkizi/views/my_progress_indicator.dart';
import 'package:chipkizi/views/progress_button.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

const _tag = 'LoginPage:';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _handleLogin(BuildContext context, MainModel model) async {
      StatusCode statusCode = await model.loginWithGoogle();

      switch (statusCode) {
        case StatusCode.success:
          Navigator.pop(context);
          break;
        case StatusCode.failed:
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text(errorMessage)));
          break;
        default:
          print('$_tag unhandled status code: $statusCode');
      }
    }

    final _appBar = AppBar(
      elevation: 0.0,
      title: Hero(
          tag: TAG_APP_TITLE,
          flightShuttleBuilder: (
            context,
            animation,
            duration,
            _,
            __,
          ) {
            return Icon(
              Icons.fiber_manual_record,
              color: Colors.white,
            );
          },
          child: Text(loginText)),
      leading: IconButton(
        icon: Icon(Icons.keyboard_arrow_down),
        onPressed: () => Navigator.pop(context),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: _appBar,
      body: Center(
        child: ScopedModelDescendant<MainModel>(
          builder: (_, __, model) {
            return Builder(
              builder: (context) {
                return Hero(
                  tag: TAG_MAIN_BUTTON,
                  child: ProgressButton(
                    color: Colors.white,
                    button: IconButton(
                      icon: Icon(
                        Icons.lock,
                        size: 80,
                      ),
                      onPressed: () => _handleLogin(context, model),
                    ),
                    size: 150.0,
                    indicator: MyProgressIndicator(
                      color: Colors.orange,
                      value:
                          model.loginStatus == StatusCode.waiting ? null : 0.0,
                      size: 50.0,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
