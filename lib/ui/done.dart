import 'package:flutter/material.dart';
import 'package:menu_kantin/widget/sidebar.dart';

class Done extends StatefulWidget {

  @override
  _DonePageState createState() => _DonePageState();
}

class _DonePageState extends State<Done> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Text('Riwayat Pesanan'),
      ),
    );
  }




}
