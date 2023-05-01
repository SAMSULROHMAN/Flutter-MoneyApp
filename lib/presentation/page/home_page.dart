import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:moneyrecord/config/session.dart';
import 'package:moneyrecord/presentation/page/auth/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            Text('HomePage'),
            IconButton(
              onPressed: () {
                Session.clearUser();
                Get.off(() => const LoginPage());
              },
              icon: Icon(Icons.logout),
            )
          ],
        ),
      ),
    );
  }
}
