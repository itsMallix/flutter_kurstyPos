import 'package:bloc/bloc.dart';
import 'package:flutter_krustypos/data/datasource/product_local_datasource.dart';
import 'package:flutter_krustypos/data/models/response/product_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_product_event.dart';
part 'local_product_state.dart';
part 'local_product_bloc.freezed.dart';

class LocalProductBloc extends Bloc<LocalProductEvent, LocalProductState> {
  final ProductLocalDatasource productLocalDatasource;
  LocalProductBloc(this.productLocalDatasource) : super(const _Initial()) {
    on<_GetLocalProducts>((event, emit) async {
      emit(const LocalProductState.loading());
      emit(const _Loading());
      try {
        final result = await productLocalDatasource.getProducts();
        emit(LocalProductState.loaded(result));
      } catch (e) {
        emit(LocalProductState.error(e.toString()));
      }
    });
  }
}
