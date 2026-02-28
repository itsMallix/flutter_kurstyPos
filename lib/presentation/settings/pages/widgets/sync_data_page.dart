import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_krustypos/presentation/settings/bloc/bloc/sync_product_bloc.dart';

class SyncDataPage extends StatefulWidget {
  const SyncDataPage({super.key});

  @override
  State<SyncDataPage> createState() => _SyncDataPageState();
}

class _SyncDataPageState extends State<SyncDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text("sync data pages"),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<SyncProductBloc>().add(
                SyncProductEvent.syncProduct(),
              );
            },
            child: Text("sync product"),
          ),
        ],
      ),
    );
  }
}
