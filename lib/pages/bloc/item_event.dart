part of 'item_bloc.dart';

@immutable
sealed class ItemEvent {}

final class LoadItem extends ItemEvent {}

final class CreateItem extends ItemEvent {
  final Item newItem;
  CreateItem(this.newItem);
}

final class UpdateItem extends ItemEvent {
  final Item updatedItem;
  UpdateItem(this.updatedItem);
}

final class DeleteItem extends ItemEvent {
  final int itemId;
  DeleteItem(this.itemId);
}
