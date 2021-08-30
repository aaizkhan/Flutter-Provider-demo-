import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_demo/model/mymodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
          create: (context) => MyModel(), child: MyHomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Provider Example',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Counter',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.amber,
                  child: IconButton(
                    onPressed: provider.subractData,
                    icon: Icon(
                      CupertinoIcons.minus,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Consumer<MyModel>(builder: (context, data, child) {
                  return Text(
                    '${data.counter}',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  );
                }),
                SizedBox(
                  width: 30,
                ),
                CircleAvatar(
                  backgroundColor: Colors.green,
                  child: IconButton(
                    onPressed: provider.addData,
                    icon: Icon(
                      CupertinoIcons.plus,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Divider(),
            SizedBox(
              height: 30,
            ),
            Text(
              'Seekbar',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 80),
                child: Consumer<MyModel>(
                  builder: (context, data, child) {
                    return Slider(
                        value: provider.slide.toDouble(),
                        min: 1,
                        max: 100,
                        divisions: 100,
                        activeColor: Colors.green,
                        inactiveColor: Colors.grey,
                        label: '${provider.slide}',
                        onChanged: (double newValue) {
                          provider.sliderData(newValue);
                        },
                        semanticFormatterCallback: (double newValue) {
                          return '${newValue.round()}';
                        });
                  },
                ))
          ],
        ),
      ),
    );
  }
}
