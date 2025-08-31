import 'package:flutter/material.dart';
import 'package:messagerie_app/views/pages/accueil.dart';
import 'package:messagerie_app/data/notifiers.dart';
import 'package:messagerie_app/views/widgets/navbar_widget.dart';
import 'package:messagerie_app/views/pages/message.dart';

List<Widget> pages = [MyHomePage(title: 'Messagerie'), Message()];

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key, required this.titre});

  final String titre;

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text(widget.titre))),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, value, child) {
          return pages.elementAt(value);
        },
      ),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}
