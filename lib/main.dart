import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 150,
              child: ImageWidget(
                imageUrl: 'http://via.placeholder.com/350x150',
                shape: BoxShape.rectangle,
                fit: BoxFit.fill,
              ),
            ),
            /*Expanded(
              flex: 1,
              child: ImageWidget(
                imageUrl: 'http://via.placeholder.com/350x150',
                shape: BoxShape.rectangle,
                fit: BoxFit.fill,
              ),
            ),*/
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class ImageWidget extends StatefulWidget {
  final String imageUrl;
  final BoxShape shape;
  final BoxFit fit;

  ImageWidget(
      {this.imageUrl, this.shape: BoxShape.rectangle, this.fit: BoxFit.contain})
      : assert(imageUrl != null),
        assert(shape != null),
        assert(fit != null);

  @override
  State<StatefulWidget> createState() {
    return _ImageWidget();
  }
}

class _ImageWidget extends State<ImageWidget> {
  @override
  Widget build(BuildContext context) {
    print('image widget');
    return GestureDetector(
        onTap: () {
          //MessageUtilities.showShortToast('tap');
          print("tap");
        },
        child: Container(
          child: CachedNetworkImage(
            imageUrl: widget.imageUrl,
            placeholder: (context, url) => Container(
              height: 0,
              width: 0,
            ),
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                shape: widget.shape,
                image: DecorationImage(
                  image: imageProvider,
                  fit: widget.fit,
                ),
              ),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ));
  }
}
