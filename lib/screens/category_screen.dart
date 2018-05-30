import 'package:ecommerce_flutter/navigations/my_navigator.dart';
import 'package:ecommerce_flutter/screens/item_screen.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => new _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final List<String> images = [
    "https://static-mercariapp-com.akamaized.net/thumb/photos/m46002701468_1.jpg?15274785280",
    "https://static-mercariapp-com.akamaized.net/thumb/photos/m72155583297_1.jpg?1527521123",
    "https://static-mercariapp-com.akamaized.net/thumb/photos/m78820602650_1.jpg?1527438624",
    "https://static-mercariapp-com.akamaized.net/thumb/photos/m21813387293_1.jpg?1527437150",
    "https://static-mercariapp-com.akamaized.net/thumb/photos/m12000053113_1.jpg?1527370461",
    "https://static-mercariapp-com.akamaized.net/thumb/photos/m99422289439_1.jpg?1527369859"
  ];

  final List<String> viewed = [
    "https://static-mercariapp-com.akamaized.net/thumb/photos/m60493680091_1.jpg?1523493045",
    "https://static-mercariapp-com.akamaized.net/thumb/photos/m15735188045_1.jpg?1527646774",
    "https://static-mercariapp-com.akamaized.net/thumb/photos/m30016615718_1.jpg?1527646772",
    "https://static-mercariapp-com.akamaized.net/thumb/photos/m94044748063_1.jpg?1527646772",
    "https://static-mercariapp-com.akamaized.net/thumb/photos/m31101743017_1.jpg?1527646772",
  ];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new SingleChildScrollView(
        child: new Container(
          padding: const EdgeInsets.only(top: 8.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new CategoryItems(
                      image: "assets/ic_women.png", title: "Women"),
                  new CategoryItems(image: "assets/ic_men.png", title: "Men"),
                  new CategoryItems(image: "assets/ic_kids.png", title: "Kids"),
                  new CategoryItems(image: "assets/ic_home.png", title: "Home"),
                  new CategoryItems(
                      image: "assets/ic_vintage.png", title: "Vintage"),
                ],
              ),
              new Divider(
                color: Colors.transparent,
                indent: 8.0,
              ),
              new Row(
                children: <Widget>[
                  new CategoryItems(
                      image: "assets/ic_beauty.png", title: "Beauty"),
                  new CategoryItems(image: "assets/ic_tech.png", title: "Tech"),
                  new CategoryItems(
                      image: "assets/ic_sport.png", title: "Sports"),
                  new CategoryItems(
                      image: "assets/ic_handmade.png", title: "Handmade"),
                  new CategoryItems(
                      image: "assets/ic_other.png", title: "Other"),
                ],
              ),
              new Divider(
                height: 16.0,
              ),
              new StatusTitle("Sold in the last 10 minutes"),
              new StatusItems(images),
              new StatusTitle("Most viewed"),
              new StatusItems(viewed),
            ],
          ),
        ),
      ),
    );
  }
}

class StatusItems extends StatelessWidget {
  final List<String> images;

  StatusItems(this.images);

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new SizedBox.fromSize(
        size: new Size.fromHeight(250.0),
        child: new PageView.builder(
          controller: new PageController(viewportFraction: 0.8, initialPage: 1),
          itemCount: images.length,
          itemBuilder: (BuildContext context, int index) {
            return new Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
              child: Material(
                elevation: 5.0,
                borderRadius: new BorderRadius.circular(8.0),
                child: new GestureDetector(
                  onTap: () {MyNavigator.goToItem(context);},
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      new Hero(
                        tag: 'item-picture',
                        child: new Image.network(
                          images[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                      new DecoratedBox(
                        decoration: new BoxDecoration(
                          gradient: new LinearGradient(
                            begin: new FractionalOffset(0.5, 1.0),
                            end: new FractionalOffset(0.5, 0.0),
                            stops: [0.0, 0.5],
                            colors: [Colors.black, Colors.transparent],
                          ),
                        ),
                      ),
                      new Container(
                        margin: const EdgeInsets.all(8.0),
                        child: new Align(
                          alignment: Alignment.bottomLeft,
                          child: new Row(
                            children: <Widget>[
                              new Expanded(
                                flex: 1,
                                child: new Text(
                                  '¥ 600',
                                  style: new TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Avenir',
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                              new Text(
                                '123',
                                style: new TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Avenir',
                                  fontSize: 20.0,
                                ),
                              ),
                              new Container(
                                padding: const EdgeInsets.only(bottom: 6.0),
                                child: new Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class StatusTitle extends StatelessWidget {
  String title;

  StatusTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Expanded(
          flex: 1,
          child: new Container(
            padding: const EdgeInsets.only(left: 8.0, top: 16.0),
            child: new Text(
              this.title,
              style: new TextStyle(
                  fontFamily: 'Avenir',
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ),
        new Container(
          padding: const EdgeInsets.only(right: 8.0, top: 16.0),
          child: new Icon(
            Icons.chevron_right,
            color: Colors.teal,
          ),
        )
      ],
    );
  }
}

class CategoryItems extends StatelessWidget {
  String image;
  String title;

  CategoryItems({this.image, this.title});

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      flex: 1,
      child: new Column(
        children: <Widget>[
          new Image(
            image: AssetImage(this.image),
          ),
          new Divider(
            indent: 2.0,
            color: Colors.transparent,
          ),
          new Text(
            this.title,
            style: new TextStyle(fontFamily: 'Avenir'),
          )
        ],
      ),
    );
  }
}
