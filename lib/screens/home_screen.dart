import 'package:ecommerce_flutter/navigations/my_navigator.dart';
import 'package:ecommerce_flutter/screens/item_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_flutter/screens/category_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Scaffold(
          appBar: new AppBar(
            title: new Text(
              'Mercary',
              style: new TextStyle(fontFamily: 'Avenir'),
            ),
            actions: <Widget>[
              new IconButton(
                icon: new Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
            ],
          ),
          body: new TabBarView(
            controller: tabController,
            children: <Widget>[
              new CategoryPage(),
              new ItemsPage(),
              new ItemsPage(),
            ],
          ),
          bottomNavigationBar: new Material(
            type: MaterialType.card,
            color: Colors.white,
            child: new TabBar(
              isScrollable: false,
              labelColor: Colors.teal,
              indicatorColor: Colors.teal,
              controller: tabController,
              tabs: <Widget>[
                new Tab(
                  icon: new Icon(
                    Icons.drive_eta,
                    color: Colors.grey[850],
                  ),
                  text: 'Drive',
                ),
                new Tab(
                  icon: new Icon(
                    Icons.add,
                    color: Colors.grey[850],
                  ),
                  text: 'Add',
                ),
                new Tab(
                  icon: new Icon(
                    Icons.notifications,
                    color: Colors.grey[850],
                  ),
                  text: 'Notification',
                )
              ],
            ),
          ),
        ),
        new CircleButton(
          icon: Icons.camera_alt,
          width: 85.0,
          height: 85.0,
          tap: () => MyNavigator.goToItem(context),
        ),
      ],
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}

class NewPage extends StatelessWidget {
  final String title;
  NewPage(this.title);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: new Center(
        child: new Text(
          title,
          style: new TextStyle(fontFamily: 'Avenir'),
        ),
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  IconData icon;
  double width;
  double height;
  Function tap;

  CircleButton({this.icon, this.width, this.height, this.tap});
  @override
  Widget build(BuildContext context) {
    return new Align(
      alignment: Alignment.bottomCenter,
      child: new Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(8.0),
        width: this.width + 10,
        height: this.height + 10,
        decoration: new ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(100.0)),
            ),
            color: Colors.white),
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(8.0),
          width: this.width,
          height: this.height,
          decoration: new ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(100.0)),
              ),
              shadows: [
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 3.0),
                    blurRadius: 4.0)
              ],
              color: Colors.teal),
          child: new GestureDetector(
            child: new Container(
              child: new Icon(
                this.icon,
                color: Colors.white,
              ),
            ),
            onTap: this.tap,
          ),
        ),
      ),
    );
  }
}
