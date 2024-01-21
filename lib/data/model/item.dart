class DataItem {
  final List<Item> data;
  DataItem({required this.data});
  factory DataItem.fromJson(List<dynamic> json) => DataItem(
        data: json.map((item) => Item.fromModel(item)).toList(),
      );
}

class Item {
  final int id;
  final String judul;
  final String deskripsi;
  final String avatar;

  Item({
    required this.id,
    required this.judul,
    required this.deskripsi,
    required this.avatar,
  });

  factory Item.fromModel(Map<String, dynamic> json) => Item(
      id: int.parse(json['id']),
      judul: json['judul'],
      deskripsi: json['deskripsi'],
      avatar: json['avatar']);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'judul': judul,
      'deskripsi': deskripsi,
      'avatar': avatar,
    };
  }
}
