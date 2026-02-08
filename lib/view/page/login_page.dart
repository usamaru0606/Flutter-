import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_app/provider/viewmodel/auth_provider.dart';

class LoginPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await ref.read(authNotifierProvider.notifier).login('test', 'test');

            if (authState.isLoggedIn) {
              Navigator.pushReplacementNamed(context, '/list');
            }
          },
          child: Text('ログイン'),
        ),
      ),
    );
  }
}
