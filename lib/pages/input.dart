import 'package:flutter/material.dart';
import 'package:uts_pm2_ahmad/pages/galerikarya.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uts_pm2_ahmad/data/model/item.dart';
import 'package:uts_pm2_ahmad/pages/bloc/item_bloc.dart';

class InputPage extends StatefulWidget {
  final Item? itemToEdit;
  final bool isEditing;

  InputPage({Key? key, this.itemToEdit, this.isEditing = false})
      : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final _avatarController = TextEditingController();
  final _judulController = TextEditingController();
  final _deskripsiController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    if (widget.itemToEdit != null) {
      _avatarController.text = widget.itemToEdit!.avatar;
      _judulController.text = widget.itemToEdit!.judul;
      _deskripsiController.text = widget.itemToEdit!.deskripsi;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEditing ? 'Edit Item' : 'Input Item'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ListAlat(),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _avatarController,
                decoration: InputDecoration(labelText: 'Avatar Link'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an avatar URL.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _judulController,
                decoration: InputDecoration(labelText: 'Judul'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _deskripsiController,
                decoration: InputDecoration(labelText: 'Deskripsi'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    final newItem = Item(
                      id: widget.itemToEdit?.id ?? 0,
                      avatar: _avatarController.text,
                      judul: _judulController.text,
                      deskripsi: _deskripsiController.text,
                    );
                    if (widget.itemToEdit != null) {
                      context.read<ItemBloc>().add(UpdateItem(newItem));
                    } else {
                      context.read<ItemBloc>().add(CreateItem(newItem));
                    }
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListAlat(),
                      ),
                    );
                  }
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _avatarController.dispose();
    _judulController.dispose();
    _deskripsiController.dispose();
    super.dispose();
  }
}
