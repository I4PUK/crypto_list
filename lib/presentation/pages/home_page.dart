import 'package:crypto_list/main.dart';
import 'package:crypto_list/presentation/bloc/crypto_list_cubit.dart';
import 'package:crypto_list/presentation/bloc/main_balance/main_balance_cubit.dart';
import 'package:crypto_list/presentation/widgets/crypto_list.dart';
import 'package:crypto_list/presentation/widgets/main_balance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cryptoListCubit = context.read<CryptoListCubit>();
    final mainBalanceCubit = context.read<MainBalanceCubit>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const SizedBox(),
        toolbarHeight: 150.0,
        title: InkWell(
          child: const Center(child: MainBalanceWidget()),
          onTap: () => mainBalanceCubit.updateMainTickerBalance(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              splashRadius: 0.1,
              onPressed: () {
                MyApp.of(context).changeTheme();
              },
              icon: const Icon(Icons.wb_sunny),
              alignment: Alignment.topRight,
            ),
          )
        ],
      ),
      body: const TickersListWidget(),
    );
  }
}
