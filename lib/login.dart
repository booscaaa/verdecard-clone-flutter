import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  PageController controller = PageController(initialPage: 0);
  bool isSwitched = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _startSwitch();
  }

  _startSwitch() async {
    await Future.delayed(new Duration(milliseconds: 5000));
    print(controller.page.toInt());
    if (controller.page.toInt() == 2) {
      controller.jumpToPage(0);
    } else {
      controller.animateToPage(controller.page.toInt() + 1,
          duration: Duration(milliseconds: 500), curve: Curves.linear);
    }

    _startSwitch();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff282827),
      child: Stack(
        children: <Widget>[
          Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Opacity(
                  opacity: 0.3,
                  child: PageView(
                    controller: controller,
                    children: <Widget>[
                      Image.asset(
                        "images/login.jpg",
                        fit: BoxFit.fitHeight,
                      ),
                      Image.asset(
                        "images/login2.jpg",
                        fit: BoxFit.fitHeight,
                      ),
                      Image.asset(
                        "images/login3.jpg",
                        fit: BoxFit.fitHeight,
                      )
                    ],
                  ))),
          SafeArea(
              child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
                padding: EdgeInsets.all(45),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          height: 50,
                          child: Image.asset("images/logo.png"),
                        ),
                        Text(
                          'VerdeCard',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            decoration: BoxDecoration(
                              color: Color(0xff282827).withOpacity(0.4),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: TextField(
                              style: new TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  decorationColor: Colors.white),
                              decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                  border: InputBorder.none,
                                  hintText: 'CPF'),
                            )),
                        Padding(padding: EdgeInsets.all(2)),
                        Container(
                            decoration: BoxDecoration(
                              color: Color(0xff282827).withOpacity(0.4),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: TextField(
                              obscureText: true,
                              style: new TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  decorationColor: Colors.white),
                              decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                  border: InputBorder.none,
                                  hintText: 'Senha'),
                            )),
                        Padding(padding: EdgeInsets.all(2)),
                        Container(
                          height: 50,
                          width: double.infinity,
                          child: OutlineButton(
                            borderSide:
                                BorderSide(color: Color(0xff598643), width: 2),
                            textColor: Colors.white,
                            onPressed: () {},
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0)),
                            child: Text('Entrar'),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Lembrar usuário',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Switch(
                              value: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                });
                              },
                              activeTrackColor: Colors.lightGreenAccent,
                              activeColor: Colors.green,
                            ),
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text('Esqueci minha senha',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.white,
                            )),
                        Padding(
                          padding: EdgeInsets.all(10),
                        ),
                        Container(
                          width: double.infinity,
                          height: 50,
                          child: RaisedButton(
                            elevation: 1,
                            color: Color(0xff598643),
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0)),
                            onPressed: () {},
                            textColor: Colors.white,
                            child: Text('CRIAR CONTA'),
                          ),
                        )
                      ],
                    )
                  ],
                )),
          ))
        ],
      ),
    );
  }
}
