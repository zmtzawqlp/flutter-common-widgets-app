import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../../../../../common/widget_demo.dart';
import './demo.dart';

const String _stackText0 = """### **简介**
> 显示来自子项列表的单个子项。
- 只显示指定位置的窗口小部件，其他的位置的窗口小部件不会显示，所以indexedStack的尺寸永远和最大的子节点一样。
- 如果value 为null，将不显示任何内容
""";
const String _stackText1 = """### **基本用法**
> index → int
- 控制显示孩子的索引
- ex:可以通过多个图片转化表示状态（正确，错误，警告等）。
 """;

class Demo extends StatefulWidget {
  static const String routeName = '/element/Frame/Stack/IndexedStack';

  @override
  State<StatefulWidget> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  String _desc = "IndexedStack 使用";
  int currIndex = 0;

  void _indexAdd() {
    setState(() {
      if (currIndex > 4)
        currIndex = 0;
      else
        currIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'IndexedStack',
      // desc: _desc,
      codeUrl:
          'https://github.com/alibaba-paimai-frontend/flutter-common-widgets-app/blob/dev/sanlu-0.0.4/lib/widgets/elements/Frame/Stack/IndexedStack/demo.dart',
      docUrl: 'https://docs.flutter.io/flutter/widgets/IndexedStack-class.html',
      contentList: [
        _stackText0,
        _stackText1,
        _IndexedStackCreate(),
      ],
    );
  }

  Column _IndexedStackCreate() {
    return new Column(
      children: <Widget>[
        SizedBox(
          height: 10.0,
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              color: new Color(0xffe91e63),
              child: StackDefault(0),
            ),
            Container(
              color: new Color(0xffe91e63),
              child: StackDefault(1),
            )
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StackIndex(0),
            StackIndex(1),
            StackIndex(2),
            StackIndex(3),
            StackIndex(4),
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FlatButton.icon(
                onPressed: () {
                  _indexAdd();
                },
                icon: new Icon(Icons.adb),
                label: Text("点击这里")),
            StackIndex(currIndex)
          ],
        )
      ],
    );
  }
}
