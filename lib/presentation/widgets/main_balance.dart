import 'package:crypto_list/presentation/bloc/main_balance/main_balance_cubit.dart';
import 'package:crypto_list/presentation/bloc/main_balance/main_balance_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainBalanceWidget extends StatelessWidget {
  const MainBalanceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<MainBalanceCubit>();

    return BlocBuilder<MainBalanceCubit, MainBalanceState>(
      builder: (context, state) {
        if (state is MainBalanceLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Main currency:',
              textAlign: TextAlign.center,
            ),
            Text(
              cubit.mainTicker.name +
                  ": " +
                  cubit.mainTicker.value.toString() +
                  ' \$',
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }
}
