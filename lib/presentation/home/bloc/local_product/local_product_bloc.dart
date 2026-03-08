import 'package:bloc/bloc.dart';
import 'package:flutter_krustypos/data/models/response/product_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_product_event.dart';
part 'local_product_state.dart';
part 'local_product_bloc.freezed.dart';

class LocalProductBloc extends Bloc<LocalProductEvent, LocalProductState> {
  LocalProductBloc() : super(_Initial()) {
    on<LocalProductEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
