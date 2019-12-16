import 'package:flutter/material.dart';

class YingjiPage extends StatefulWidget {
  @override
  _YingjiStopState createState() => _YingjiStopState();
}

const LIST = [
  {'title': '1#生产线-加压风机'},
  {'title': '1#生产线-加压风机'},
  {'title': '1#生产线-加压风机'},
  {'title': '1#生产线-加压风机'},
  {'title': '1#生产线-加压风机'},
  {'title': '1#生产线-加压风机'},
  {'title': '1#生产线-加压风机'},
  {'title': '1#生产线-加压风机'},
  {'title': '1#生产线-加压风机'},
  {'title': '1#生产线-加压风机'},
  {'title': '1#生产线-加压风机'},
  {'title': '1#生产线-加压风机'},
];

class _YingjiStopState extends State<YingjiPage> {
  double paddingTop;

  @override
  Widget build(BuildContext context) {
    paddingTop = MediaQuery.of(context).padding.top;
    return Column(
      children: <Widget>[
        topContent(),
        middleContent(),
        factory(),
        factory(),
        bottomContent1(),
        bottomContent()
      ],
    );
  }

  topContent() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.green, Colors.greenAccent],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight)),
      child: Container(
          margin: EdgeInsets.only(top: paddingTop + 10),
          padding: EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
          child: Row(
            children: <Widget>[
              Text(
                '行业',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Expanded(
                  child: Container(
                margin: EdgeInsets.only(
                  left: 20,
                ),
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(19),
                    color: Color(0x90ffffff)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, //均分分布
                  children: <Widget>[
                    Text(
                      '全部',
                      style: TextStyle(fontSize: 15, color: Colors.green),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.green,
                    ),
                  ],
                ),
              ))
            ],
          )),
    );
  }

  middleContent() {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
      padding: EdgeInsets.only(top: 30, bottom: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.white, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _item(Icons.donut_small, '运行', Colors.greenAccent),
          _item(Icons.delete, '停止', Colors.deepOrangeAccent),
          _item(Icons.description, '离线', Colors.grey),
        ],
      ),
    );
  }

  _item(IconData iconData, String s, Color color) {
    return Row(
      children: <Widget>[
        Icon(
          iconData,
          color: color,
        ),
        Text(
          s,
        )
      ],
    );
  }

  factory() {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
      padding: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.white, width: 1),
      ),
      child: Column(
        children: <Widget>[
          item_title('晋中能源股份有限公司章村矿矸石热电厂'),
          line_green(),

          Padding(
            padding: EdgeInsets.only(top: 15, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _item(Icons.donut_small, '1#生产设备-发电机', Colors.greenAccent),
                _item(Icons.delete, '1#治污设备', Colors.grey),
              ],
            ),
          )
        ],
      ),
    );
  }

  line_green(){
    return  Divider(
      height: 10,
      color: Colors.greenAccent,
      indent: 5,
      endIndent: 5,
    );
  }
  bottomContent1() {
    return Container(
      margin: EdgeInsets.only(top: 5, left: 10, right: 10),
      padding: EdgeInsets.only(top: 5, left: 5, right: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(5), topLeft: Radius.circular(5)),
        border: Border.all(color: Colors.white, width: 1),
      ),
      child: Column(
        children: <Widget>[
          item_title('隆兴化工有限公司'),
          line_green(),
        ],
      ),
    );
  }

  bottomContent() {
    return Expanded(
        child: Container(
            margin: EdgeInsets.only( bottom: 10, left: 10, right: 10),
            padding: EdgeInsets.only( bottom: 10, left: 20, right: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                bottomRight: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              ),
              border: Border.all(color: Colors.white, width: 1),
            ),
            child: _List()));
  }

  item_title(String title) {
    return Row(
      children: <Widget>[
        Container(
          width: 5,
          height: 5,
          margin: EdgeInsets.only(left: 6, right: 6),
          decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.circular(5)),
        ),
        Text(title)
      ],
    );
  }
}

_List() {
  return GridView.count(
    crossAxisCount: 2,
//    mainAxisSpacing: 0,
//    //垂直间距
//    crossAxisSpacing: 0,
    //水平间距
    childAspectRatio: 4,
    //长宽比
    children: LIST.map((item) {
      return _item(item);
    }).toList(),
  );
}

Widget _item(Map<String, String> item) {
  return Row(
    children: <Widget>[
      Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      Text(item['title']),
    ],
  );
}
