import 'package:flutter/material.dart';
import 'package:flutter_bloc_basic/bloc/counter_bloc.dart';

void main() => runApp(MyApp());

// 최상위 레벨에 선언을 해주면 어디든 사용 가능!!
final counterBloc = CounterBloc();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample Code'),
      ),
      body: Center(
        child: StreamBuilder<int>(
            stream: counterBloc.count$,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                    'You have pressed the button ${snapshot.data} times.');
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          // 카운터 블록에서 카운터 1씩 더하기
          counterBloc.addCounter();
        }),
        tooltip: 'Increment Counter',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
