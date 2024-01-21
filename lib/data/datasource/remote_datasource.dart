import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:uts_pm2_ahmad/data/model/item.dart';

class RemoteDataSource {
  final dio =
      Dio(BaseOptions(baseUrl: 'https://65acfbe3adbd5aa31bdfe022.mockapi.io'));

  Future<DataItem> getItems() async {
    final response = await dio.get('/items');
    log(response.data.toString());
    return DataItem.fromJson(response.data);
  }

  Future<Item> createItem(Item newItem) async {
    final response = await dio.post('/items', data: newItem.toJson());
    log(response.data.toString());
    return Item.fromModel(response.data);
  }

  Future<Item> updateItem(Item updatedItem) async {
    final response =
        await dio.put('/items/${updatedItem.id}', data: updatedItem.toJson());
    log(response.data.toString());
    return Item.fromModel(response.data);
  }

  Future<void> deleteItem(int itemId) async {
    await dio.delete('/items/$itemId');
  }
}
