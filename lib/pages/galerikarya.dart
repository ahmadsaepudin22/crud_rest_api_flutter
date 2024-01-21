import 'package:flutter/material.dart';
import 'package:uts_pm2_ahmad/data/datasource/remote_datasource.dart';
import 'package:uts_pm2_ahmad/pages/bloc/item_bloc.dart';
import 'package:uts_pm2_ahmad/pages/input.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListAlat extends StatefulWidget {
  const ListAlat({Key? key}) : super(key: key);

  @override
  _ListAlatState createState() => _ListAlatState();
}

class _ListAlatState extends State<ListAlat> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ItemBloc(remoteDataSource: RemoteDataSource())..add(LoadItem()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Galeri Karya'),
        ),
        body: MyRefreshIndicator(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => InputPage(),
              ),
            );
          },
          tooltip: 'Add',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class MyRefreshIndicator extends StatelessWidget {
  void _showDeleteConfirmationSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Data berhasil dihapus'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<ItemBloc>().add(LoadItem());
      },
      child: BlocConsumer<ItemBloc, ItemState>(
        listener: (context, state) {
          if (state is ItemError) {
            // Tambahkan handling error jika diperlukan
          } else if (state is ItemLoaded) {
            // Tambahkan handling jika data berhasil dimuat
          }
        },
        builder: (context, state) {
          if (state is ItemLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ItemLoaded) {
            final data = state.items;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(data[index].avatar),
                  ),
                  title: Text(data[index].judul),
                  subtitle: Text(data[index].deskripsi),
                  trailing: PopupMenuButton(
                    itemBuilder: (BuildContext context) => [
                      PopupMenuItem(
                        value: 'edit',
                        child: Text('Edit'),
                      ),
                      PopupMenuItem(
                        value: 'delete',
                        child: Text('Delete'),
                      ),
                    ],
                    onSelected: (String value) {
                      if (value == 'edit') {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InputPage(
                              itemToEdit: data[index],
                              isEditing: true,
                            ),
                          ),
                        );
                      } else if (value == 'delete') {
                        context
                            .read<ItemBloc>()
                            .add(DeleteItem(data[index].id));
                        _showDeleteConfirmationSnackBar(context);
                      }
                    },
                  ),
                );
              },
            );
          } else {
            // Handle state lainnya jika diperlukan
            return SizedBox();
          }
        },
      ),
    );
  }
}
