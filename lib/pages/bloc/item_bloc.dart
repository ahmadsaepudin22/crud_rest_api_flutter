import 'package:flutter/material.dart';
import 'package:uts_pm2_ahmad/data/datasource/remote_datasource.dart';
import 'package:uts_pm2_ahmad/data/model/item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final RemoteDataSource remoteDataSource;

  ItemBloc({required this.remoteDataSource}) : super(ItemInitial()) {
    on<LoadItem>((event, emit) async {
      emit(ItemLoading());
      try {
        final result = await remoteDataSource.getItems();
        emit(ItemLoaded(result.data));
      } catch (error) {
        emit(ItemError(error.toString()));
      }
    });

    on<CreateItem>((event, emit) async {
      try {
        final createdItem = await remoteDataSource.createItem(event.newItem);
        if (state is ItemLoaded) {
          final updatedItems = (state as ItemLoaded).items + [createdItem];
          emit(ItemLoaded(updatedItems));
        }
      } catch (error) {
        emit(ItemError(error.toString()));
      }
    });

    on<UpdateItem>((event, emit) async {
      try {
        final updatedItem =
            await remoteDataSource.updateItem(event.updatedItem);
        if (state is ItemLoaded) {
          final updatedItems = (state as ItemLoaded)
              .items
              .map((item) => item.id == updatedItem.id ? updatedItem : item)
              .toList();
          emit(ItemLoaded(updatedItems));
        }
      } catch (error) {
        emit(ItemError(error.toString()));
      }
    });

    on<DeleteItem>((event, emit) async {
      try {
        await remoteDataSource.deleteItem(event.itemId);
        if (state is ItemLoaded) {
          final remainingItems = (state as ItemLoaded)
              .items
              .where((item) => item.id != event.itemId)
              .toList();
          emit(ItemLoaded(remainingItems));
        }
      } catch (error) {
        emit(ItemError(error.toString()));
      }
    });
  }
}
