# sliver_head_automatic_adsorption

This is a custom sliver component that can automatically attach to the top

## Start

## Table of contents

- [Simple Use](#simple)
- [Example Code](#example)
- [Import Use](#import)

### Example

[sliver_example](./example/lib/sliver_example.dart)

<img src="./README/images/dtu.gif" width = 230 height = 500  alt="Alternate text"/> <img src="./README/images/ltr.gif" width = 230 height = 500  alt="Alternate text"/> <img src="./README/images/simpleuse.gif" width = 230 height = 500  alt="Alternate text"/>

<a id="simple"></a>

### Simple Use

``` dart
ScrollController controller = ScrollController();
SliverAdsorptionAppbar(
          controller: controller,
          collapsedColors: Colors.yellow,
          slivers: [
            SliverList.builder(
              itemBuilder: (c, i) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  color: Colors.blue,
                  height: 100,
                  child: Center(
                    child: Text(
                      "$i",
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                );
              },
              itemCount: 50,
            ),
          ],
          expandedWidget: Container(),
        )
```

<a id="example"></a>

#### Example Code

``` dart
 ScrollController controller = ScrollController();

 SliverAdsorptionAppbar(
            controller: controller,
            collapsedColors: Colors.white,
            collapsedHeight: 90,
            //animationEnum: AnimationEnum.leftToRight,
            expandedWidget: Container(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              color: Colors.white,
              child: ListView(
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
                          SizedBox(height: 5),
                          Text("QQ号：210014468",
                              style: TextStyle(color: Colors.black45))
                        ],
                      ),
                      const Spacer(),
                      const Column(
                        children: [
                          Icon(Icons.fmd_good, color: Colors.black38),
                          Text("成都",
                              style: TextStyle(
                                  color: Colors.black26, fontSize: 12))
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                      "个性签名：As long as you want to do something in the world, nothing can stop you",
                      style: TextStyle(fontSize: 14, color: Colors.black38)),
                  const SizedBox(height: 10),
                  const Text("我的相册：",
                      style: TextStyle(fontSize: 14, color: Colors.black38)),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 140,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: Image.network(
                              "http://m.qpic.cn/psc?/V13kbO6L0KTqJm/bqQfVz5yrrGYSXMvKr.cqSKDpWMyZO2dUAYR8o62CXAzQZo.y5p1duZz4pNA4PlQvl7P9ITFRCtIVjtH*g1GDSu9mRSfHuyPDcxLtPlZAuQ!/b&bo=OQdABjkHQAYBJwA!&rf=viewer_4"),
                        ),
                        const SizedBox(width: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: Image.network(
                              "https://m.qpic.cn/psc?/V13kbO6L0KTqJm/LiySpxowE0yeWXwBdXN*SRad5Dx.*riskIwzt*GDBI6wJg6b2PBv8KDPQAQGW6hurmyvmtKTRb86C9VSarCVTRlpd4P1yjq4bsQzBREyLpw!/b&bo=OQdABjkHQAYBByA!&rf=viewer_4"),
                        ),
                        const SizedBox(width: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: Image.network(
                              "http://m.qpic.cn/psc?/V13kbO6L0KTqJm/bqQfVz5yrrGYSXMvKr.cqa8Sw.0xqGNfx3wgAeQhWrNh.a.P.OXZNe92fmN5ZTLMXAPekcFjFsXQhIiYLhm3H0IuJf*Yl.KkeMSDIywfO8E!/b&bo=QAZLCUAGSwkBFzA!&rf=viewer_4"),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            collapsedWidget: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("7_bit", style: TextStyle(fontSize: 18)),
                      SizedBox(height: 5),
                      Text("QQ号：210014468",
                          style: TextStyle(color: Colors.black45))
                    ],
                  ),
                  const Spacer(),
                  const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.fmd_good, color: Colors.black38),
                      Text("成都",
                          style: TextStyle(color: Colors.black26, fontSize: 12))
                    ],
                  )
                ],
              ),
            ),
            slivers: [
              SliverList.builder(
                itemBuilder: (c, i) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    color: Colors.blue,
                    height: 100,
                    child: Center(
                      child: Text(
                        "$i",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  );
                },
                itemCount: 50,
              ),
              const SliverToBoxAdapter(),
            ])

```

<a id="import"></a>

#### How to import

pubspec.yaml add dependency

dependencies:
  sliver_head_automatic_adsorption:
    git:
       url: <https://github.com/7-bit-zhang/sliver_head_automatic_adsorption.git>
       ref: "1.0.0"
