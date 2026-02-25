import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_krustypos/data/datasource/auth_local_datasource.dart';
import 'package:flutter_krustypos/data/models/response/auth_response_model.dart';
import 'package:flutter_krustypos/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:flutter_krustypos/presentation/auth/login_page.dart';

class LogoutPage extends StatefulWidget {
  const LogoutPage({super.key});

  @override
  State<LogoutPage> createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  User? user;

  @override
  void initState() {
    AuthLocalDatasource().getAuthData().then((value) {
      setState(() {
        user = value?.user;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Dashboard Page'),
            Text('Name ${user?.name ?? ''}'),
            const SizedBox(height: 10),
            BlocListener<LogoutBloc, LogoutState>(
              listener: (context, state) {
                state.maybeMap(
                  orElse: () {},
                  error: (err) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(err.message),
                        backgroundColor: Colors.red,
                      ),
                    );
                  },
                  success: (value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Logout Success"),
                        backgroundColor: Colors.green,
                      ),
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                );
              },
              child: ElevatedButton(
                onPressed: () {
                  context.read<LogoutBloc>().add(const LogoutEvent.logout());
                  AuthLocalDatasource().removeAuthData();
                },
                child: Text("Logout"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
