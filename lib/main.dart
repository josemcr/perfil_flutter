import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('User Profile'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Header(
              height: 200,
              username: 'brayden.burton',
              background: 'assets/ruta.jpg',
              userAssets: 'assets/perfil.jpg',
            ),
            Connnections(
              following: 128,
              followers: 3921,
            ),
            Description(
              text:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent in sodales mauris. Vivamus eu lectus a purus consequat dapibus nec in nisi. Aliquam consectetur, mauris ut suscipit faucibus, turpis eros malesuada justo, ac eleifend eros enim eget eros. Nulla sodales vehicula neque, sed maximus velit aliquam et. Praesent sed felis a velit lacinia interdum. Suspendisse vel velit eu leo consequat varius in sed purus. Sed leo arcu, aliquam sit amet fermentum at, pellentesque ac nisi. Praesent eu rutrum lorem. Sed ac ligula ac velit pulvinar finibus vel eu elit.',
            ),
          ],
        ),
      ),
    );
  }
}

class Description extends StatelessWidget {
  final String text;

  Description({
    Key key,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Text(
        this.text,
        style: TextStyle(
          fontSize: 12,
        ),
      ),
    );
  }
}

class Connnections extends StatelessWidget {
  final int following, followers;

  const Connnections({
    Key key,
    @required this.following,
    @required this.followers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(50, 0, 255, 0),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Connection(
            text: 'following',
            number: this.following,
          ),
          Connection(
            text: 'followers',
            number: this.followers,
          ),
        ],
      ),
    );
  }
}

class Connection extends StatelessWidget {
  final String text;
  final int number;
  const Connection({
    Key key,
    @required this.text,
    @required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(color: Color.fromARGB(120, 0, 0, 0));
    return Column(
      children: <Widget>[
        Text(
          this.text.toUpperCase(),
          style: style.copyWith(fontSize: 11),
        ),
        Text(
          '${this.number}',
          style: style.copyWith(fontSize: 18),
        ),
      ],
    );
  }
}

class Header extends StatelessWidget {
  final double height;
  final String background;
  final String userAssets;
  final String username;

  const Header({
    Key key,
    this.height = 200,
    @required this.background,
    @required this.userAssets,
    @required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(this.background),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          UserPhoto(
            assetImage: this.userAssets,
            size: 100,
          ),
          Text(
            '@${this.username}',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    );
  }
}

class UserPhoto extends StatelessWidget {
  final String assetImage;
  final double size;

  const UserPhoto({
    Key key,
    @required this.assetImage,
    this.size = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.size,
      height: this.size,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(this.assetImage),
          fit: BoxFit.cover,
        ),
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 4,
        ),
      ),
      margin: EdgeInsets.only(bottom: 5),
    );
  }
}

void main() {
  runApp(Screen1());
}
