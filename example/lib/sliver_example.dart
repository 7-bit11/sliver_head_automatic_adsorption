import 'package:flutter/material.dart';
import 'package:sliver_head_automatic_adsorption/sliver_adsorption_header.dart';

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
        body: CustomScrollView(
      controller: controller,
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          floating: false,
          delegate: SliverHeaderAutomaticDelegate(
            controller: controller,
            collapsedHeight: 60,
            expandedHeight: 500,
            paddingTop: MediaQuery.of(context).padding.top,
            defaultCollapsedColor: Colors.black,
            expandedWidget:
                const Center(child: SizedBox(child: Text("123123123"))),
          ),
        ),
        SliverList.builder(
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              height: 100,
              color: Colors.red,
            );
          },
          itemCount: 20,
        )
      ],
    ));
  }
}
