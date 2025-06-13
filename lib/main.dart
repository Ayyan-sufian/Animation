import 'package:animation/3D-list.dart';
import 'package:animation/detail_pg.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Animation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );
    animation = Tween( begin: 0.0, end: 200.0).animate(animationController);
    animationController.addListener((){
      print(animation.value);
      setState(() {
        
      });
    });
    animationController.forward();
  }

  var _width = 200.0;
  var _height = 100.0;
  bool flag = true;
  Decoration myDec = BoxDecoration(
    borderRadius: BorderRadius.circular(2),
    color: Colors.blueGrey,
  );
  var myOpac = 1.0;
  var isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 1),
              width: _width,
              height: _height,
              decoration: myDec,
              curve: Curves.fastOutSlowIn,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (flag) {
                    _width = 200.0;
                    _height = 100.0;
                    flag = false;
                    myDec = BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.blue,
                    );
                  } else {
                    _width = 100.0;
                    _height = 200.0;
                    flag = true;
                    myDec = BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Colors.blueGrey,
                    );
                  }
                });
              },
              child: Text(
                'Animation',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
            AnimatedOpacity(
              opacity: myOpac,
              curve: Curves.bounceInOut,
              duration: Duration(seconds: 2),
              child: Container(width: 200, height: 100, color: Colors.blue),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (isVisible) {
                    myOpac = 0.0;
                    isVisible = false;
                  } else {
                    isVisible = true;
                    myOpac = 1.0;
                  }
                });
              },
              child: Icon(Icons.cancel),
            ),
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => detailPg()),
                  );
                },
                child: Container(
                  height: 100,
                  child: Hero(
                    tag: 'background',
                    child: Image.asset('assets/images/rolls-royce.jpg'),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => listPg()),
                );
              },
              child: Text('3D List'),
            ),
            Container(
              width: animation.value,
              height: animation.value,
              color: Colors.blueGrey,
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
