import './webview.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatelessWidget {
  final introKey = GlobalKey<IntroductionScreenState>();

  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        title: "abyssinia mall managment system",
        body:
            "this is complted market center managment system usid to make easy every process",
        image: Image.asset("assets/logo.JPG"),
        decoration: const PageDecoration(
       pageColor: Colors.green,
          bodyTextStyle: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
      ),
      PageViewModel(
        title: "what it include",
        body: "this managing mall tenants,employees resources ,and finance systems",
        image: Image.asset("assets/logo.JPG"),
        decoration: const PageDecoration(
          pageColor: Colors.green,
          bodyTextStyle: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
      ),
      PageViewModel(
        title: "what to do ",
        body: "if you want to use this completed features of the system contact 0951050364 or contact us on telegram @abyssiniasoftware1",
        image: Image.asset("assets/logo.JPG"),
        decoration: const PageDecoration(
          pageColor: Colors.green,
          bodyTextStyle: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {

    return IntroductionScreen(
      key: introKey,

      pages: getPages(),
      onDone: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>WebviewTwo (url:'https://marketcenter.abyssiniasoftware.com'),
          ),
        );
      },
      onSkip: () async {
         SharedPreferences prefs = await SharedPreferences.getInstance();
         prefs.setBool('seen', true);
         if(prefs.getBool('seen')==true)
       Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => WebviewTwo(url:"https://marketcenter.abyssniasoftware.com"),
          ),
        );
        else  Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => IntroScreen(),
          ),
        );
      },
      showSkipButton: true,
      skip: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: const Text(
          "እለፍ",
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 16,
          ),
        ),
      ),
      next: const Icon(Icons.arrow_forward,color: Colors.red,size: 21,),
      done: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.green,
        ),
        child: const Text(
          "ቀጣይ",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Colors.grey,
        activeColor: Colors.white,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
