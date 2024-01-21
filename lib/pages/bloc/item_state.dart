part of 'item_bloc.dart';

@immutable
abstract class ItemState {
  const ItemState();
}

class ItemInitial extends ItemState {
  const ItemInitial();
}

class ItemLoading extends ItemState {
  const ItemLoading();
}

class ItemLoaded extends ItemState {
  final List<Item> items;
  const ItemLoaded(this.items);
}

class ItemError extends ItemState {
  final String error;
  const ItemError(this.error);
}
