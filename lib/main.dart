import 'package:crypto_list/presentation/bloc/crypto_list_cubit.dart';
import 'package:crypto_list/presentation/bloc/main_balance/main_balance_cubit.dart';
import 'package:crypto_list/presentation/pages/home_page.dart';
import 'package:crypto_list/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDi();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;
  ThemeData? _theme;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CryptoListCubit>()..loadTickerList(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: _theme,
        themeMode: _themeMode,
        home: MultiBlocProvider(
          providers: [
            BlocProvider<CryptoListCubit>(
              create: (context) => sl<CryptoListCubit>()..loadTickerList(),
            ),
            BlocProvider<MainBalanceCubit>(
              create: (context) => sl<MainBalanceCubit>(),
            ),
          ],
          child: const HomePage(),
        ),
      ),
    );
  }

  ThemeMode get currentTheme {
    return _themeMode;
  }

  void changeTheme() {
    setState(
      () {
        if (_themeMode == ThemeMode.dark) {
          _themeMode = ThemeMode.light;
          _theme = ThemeData.light();
        } else {
          _themeMode = ThemeMode.dark;
          _theme = ThemeData.dark();
        }
      },
    );
  }
}
