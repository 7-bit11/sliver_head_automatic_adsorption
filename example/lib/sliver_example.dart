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
            expandedWidget: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.network(
                            "https://p3-passport.byteacctimg.com/img/user-avatar/314da9adcd6dacacb8ea4a18c89639ea~360x360.awebp",
                            width: 70,
                            height: 70),
                      ),
                      const SizedBox(width: 10),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("7_bit", style: TextStyle(fontSize: 18)),
                          Text("QQ号：210014468",
                              style: TextStyle(color: Colors.black45))
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            slivers: [
          SliverList.builder(
            itemBuilder: (c, i) {
              return Text("$i");
            },
            itemCount: 100,
          ),
          const SliverToBoxAdapter(),
        ]));
  }
}
