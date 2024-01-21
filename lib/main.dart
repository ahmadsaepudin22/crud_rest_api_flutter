import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uts_pm2_ahmad/home_screen.dart';
import 'package:uts_pm2_ahmad/data/datasource/remote_datasource.dart';
import 'package:uts_pm2_ahmad/pages/bloc/item_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ItemBloc>(
          create: (_) => ItemBloc(remoteDataSource: RemoteDataSource()),
        ),
        // Tambahkan BlocProvider lain jika diperlukan
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Paint Pedia',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromARGB(255, 252, 252, 48)),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
