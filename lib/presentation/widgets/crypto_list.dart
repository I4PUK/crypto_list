import 'package:crypto_list/domain/entities/ticker.dart';
import 'package:crypto_list/presentation/bloc/crypto_list_cubit.dart';
import 'package:crypto_list/presentation/bloc/crypto_list_state.dart';
import 'package:crypto_list/presentation/bloc/main_balance/main_balance_cubit.dart';
import 'package:crypto_list/presentation/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TickersListWidget extends StatelessWidget {
  const TickersListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<CryptoListCubit>();

    return RefreshIndicator(
      onRefresh: () async {
        cubit.loadTickerList();
      },
      child: BlocConsumer<CryptoListCubit, CryptoListState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is CryptoListLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CryptoListSuccess) {
            return _buildListView(context, list: state.tickersList);
          }
          if (state is CryptoListError) {
            return Center(
              child: Text(state.message),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  _buildListView(BuildContext context, {required List<TickerEntity> list}) {
    if (list.isNotEmpty) {
      return ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          var ticker = list[index];

          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    title: ticker.name,
                    description: ticker.value.toString(),
                  ),
                ),
              );
            },
            child: ListTile(
              title: Text(ticker.name),
              subtitle: Text(ticker.value.toString() + ' USD'),
              trailing: IconButton(
                alignment: Alignment.centerRight,
                onPressed: () {
                  context.read<MainBalanceCubit>().setMainTicker(ticker);
                },
                icon: const Icon(Icons.favorite),
              ),
            ),
          );
        },
      );
    } else {
      return const Center(
        child: Text('Получен пустой список валют'),
      );
    }
  }
}
