import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_krustypos/core/constants/colors.dart';
import 'package:flutter_krustypos/data/datasource/auth_local_datasource.dart';
import 'package:flutter_krustypos/data/datasource/auth_remote_datasource.dart';
import 'package:flutter_krustypos/data/datasource/product_remote_datasource.dart';
import 'package:flutter_krustypos/presentation/auth/bloc/login/login_bloc.dart';
import 'package:flutter_krustypos/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:flutter_krustypos/presentation/auth/login_page.dart';
import 'package:flutter_krustypos/presentation/home/pages/dashboard_page.dart';
import 'package:flutter_krustypos/presentation/settings/bloc/bloc/sync_product_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => SyncProductBloc(ProductRemoteDatasource()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'KrustyPOS',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          useMaterial3: true,
          textTheme: GoogleFonts.quicksandTextTheme(
            Theme.of(context).textTheme,
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.white,
            elevation: 0,
            titleTextStyle: GoogleFonts.quicksand(
              color: AppColors.primary,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
            iconTheme: const IconThemeData(color: AppColors.primary),
          ),
        ),
        home: FutureBuilder<bool>(
          future: AuthLocalDatasource().isAuthDataExists(),
          builder: (context, asyncSnapshot) {
            if (asyncSnapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (asyncSnapshot.hasData) {
              if (asyncSnapshot.data!) {
                return DashboardPage();
              } else {
                return LoginPage();
              }
            }
            return const Scaffold(
              body: Center(
                child: Text("Error"),
              ),
            );
          },
        ),
      ),
    );
  }
}
