import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:shahe_flutter_app/dao/first_dao.dart';
import 'package:shahe_flutter_app/model/weather_model.dart';
import 'package:shahe_flutter_app/widget/loading_containter.dart';

const LIST = [
  {'title': '企业列表'},
  {'title': '异常报警'},
  {'title': '企业上云'},
  {'title': '电能分析'},
  {'title': '煤耗分析'},
  {'title': '排放检测'}
];

class FirstPage extends StatefulWidget {



  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool _loading = true;
  Result _result;
  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;
    return LoadingContainer(
        isLoading: _loading,
        child: Stack(
          children: <Widget>[
            backgound(),
            Container(
              margin: EdgeInsets.only(top: paddingTop+5),
              child: Column(
                children: <Widget>[
                  topContent(),
                  airContent(),
                  weather(),
                  wuranwu(),
                  weatherContent(),
                  bottomContent(),
                ],
              ),
            ),
          ],
        ),
    );
  }

  @override
  Future<void> initState() {
    _handleRefresh();
    super.initState();
  }

  Future<Null> _handleRefresh() async {
    try {
      WeatherModel model = await FirstDao.fetch();
      setState(() {
        _result = model.result;
        _loading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        _loading = false;
      });
    }
    return null;
  }




  backgound() {
    return FractionallySizedBox(
      heightFactor: 1,
      child:Image.asset('images/first_bg.png', fit: BoxFit.fill)
    );
  }

  location(String city) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: Chip(
        avatar: Icon(
          Icons.location_on,
          color: Colors.white,
          size: 18,
        ),
        label: Text(city,style: TextStyle(color: Colors.white),),
        padding: EdgeInsets.fromLTRB(12, 3, 12, 3),
   //     backgroundColor: Colors.black54,
        backgroundColor: ColorUtil.color('#077DFF'),
      ),
    );
  }

  updateTime(String text) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Text(
          text,
          textAlign: TextAlign.right,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  updateTime1(String text) {
    return Container(
      margin: EdgeInsets.only(right: 10, top: 10, left: 5),
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  airContent() {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(30),
          child: Text(_result!=null?_result.wendu??'':'',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              '良',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }

  topContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        location(_result!=null?_result.city??"":""), //地址
        updateTime('更新时间:'),
        updateTime1('5分钟前'),
      ],
    );
  }

  weather() {
    return Padding(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: Text(
        '天气：${_result!=null?_result.forecast[0].type:''}',
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }

  wuranwu() {
    return Text(
      _result!=null?_result.ganmao:"",
      style: TextStyle(color: Colors.white),
      textAlign: TextAlign.center,
    );
  }

}







weatherContent() {
  return Container(
    margin: EdgeInsets.only(top: 20, left: 60, right: 60),
    padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
    child: Row(
      children: <Widget>[
        Icon(
          Icons.add,
          color: Colors.white,
        ),
        Text(
          '沙河',
          style: TextStyle(color: Colors.white),
        ),
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.add,
              color: Colors.white,
            ),
            Text(
              '沙河',
              style: TextStyle(color: Colors.white),
            )
          ],
        )),
        Icon(
          Icons.add,
          color: Colors.white,
        ),
        Text(
          '沙河',
          style: TextStyle(color: Colors.white),
        ),
      ],
    ),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19), color: Color(0x30000000)),
  );
}

bottomContent() {
  return Expanded(
      child: Card(
        margin: EdgeInsets.only(top: 100, left: 30, right: 30,bottom: 80),
        color: Colors.white,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),  //设置圆角
        elevation: 5,
        child: Container(
          alignment:AlignmentDirectional.center,
          child:_List(),
        ),
  ));
}

item(String title) {
  return Padding(
    padding: EdgeInsets.only(top: 0),
    child: Column(
      children: <Widget>[
        Icon(
          Icons.local_gas_station,
          color: Colors.green,
        ),
        Text(title),
      ],
    ),
  );
}

_List() {
  return GridView.count(
    crossAxisCount: 3,
    mainAxisSpacing: 5, //垂直间距
    crossAxisSpacing: 5, //水平间距
    // childAspectRatio: 0.7, //长宽比
    children: LIST.map((item) {
      return _item(item);
    }).toList(),
  );
}

Widget _item(Map<String, String> item) {
  return Container(
    child: Column(
      children: <Widget>[
        Icon(
          Icons.local_gas_station,
          color: Colors.green,
        ),
        Text(item['title']),
      ],
    ),
  );
}
