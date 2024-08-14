import 'package:flutter/material.dart';
import 'package:sliver_head_automatic_adsorption/sliver_adsorption_appbar.dart';

class SliverExample extends StatefulWidget {
  const SliverExample({super.key});

  @override
  State<SliverExample> createState() => _SliverExampleState();
}

class _SliverExampleState extends State<SliverExample> {
  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SliverAdsorption(
            controller: controller,
            expandedWidget: Text("展开后的组件"),
            slivers: [
          SliverList.builder(
            itemBuilder: (c, i) {
              return Text("$i");
            },
            itemCount: 100,
          )
        ]));
  }
}
