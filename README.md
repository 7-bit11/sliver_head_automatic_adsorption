# sliver_head_automatic_adsorption

This is a custom sliver component that can automatically attach to the top

## Start

### <a herf="./example/lib/sliver_example.dart">sliver_example</a>

<img src="./README/images/dtu.gif" width = 250 height = 500  alt="Alternate text"/>
<img src="./README/images/ltr.gif" width = 250 height = 500  alt="Alternate text"/>

### Simple Use

<img src="./README/images/simpleuse.gif" width = 250 height = 500  alt="Alternate text"/>

#### Demo Code

``` date
ScrollController controller = ScrollController();
SliverAdsorption(
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
