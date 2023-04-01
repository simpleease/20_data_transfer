import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  CounterPage({Key key}) : super(key: key);

  int count = 0;

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {

  int get count  => (widget as CounterPage).count;
  set count(int val) {
   (widget as CounterPage).count = val;
  }

  void _incrementCounter() => setState(() { ++count; });


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return CountContainer(
      //increment: _incrementCounter,
        model: this,
        increment: _incrementCounter,
        child:Counter()
    );
  }
}


class CountContainer extends InheritedWidget {
  static CountContainer of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<CountContainer>() as CountContainer;

  final _CounterPageState model;

  final Function() increment;


  CountContainer({
    Key key,
    @required this.model,
    @required this.increment,
    @required Widget child,
  }): super(key: key, child: child);

  @override
  bool updateShouldNotify(CountContainer oldWidget) => model != oldWidget.model || model.count != oldWidget.model.count;

}


class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CountContainer state = CountContainer.of(context);

    return Scaffold(
      appBar: AppBar(

        title: Text("InheritedWidget demo"),
      ),
      body: Text(
        'You have pushed the button this many times: ${state.model.count}',
      ),
      floatingActionButton: FloatingActionButton(onPressed: state.increment),
    );
  }
}