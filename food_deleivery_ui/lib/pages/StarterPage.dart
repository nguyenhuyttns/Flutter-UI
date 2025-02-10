import 'package:flutter/material.dart';
import 'package:food_deleivery_ui/FadeAnimation.dart';
import 'package:food_deleivery_ui/pages/HomePage.dart';
import 'package:page_transition/page_transition.dart';

class StarterPage extends StatefulWidget {
  @override
  _StartedPageState createState() => _StartedPageState();
}

class _StartedPageState extends State<StarterPage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  bool _textVisible = true;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));

    _animation =
        Tween<double>(begin: 1.0, end: 25.0).animate(_animationController);

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTap() {
    setState(() {
      _textVisible = false;
    });

    _animationController.forward().then(
          (f) => Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: HomePage(),
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/pic1.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.9),
                Colors.black.withOpacity(0.8),
                Colors.black.withOpacity(0.2),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeAnimation(
                  delay: 1.0,
                  child: Text(
                    'Taking order for delivery',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FadeAnimation(
                  delay: 1.1,
                  child: Text(
                    'See restaurents nearly by \nadding location',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                FadeAnimation(
                  delay: 1.3,
                  child: ScaleTransition(
                    scale: _animation,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: [
                              Colors.yellow,
                              Colors.orange,
                            ],
                          )),
                      child: FadeAnimation(
                        delay: 1.2,
                        child: AnimatedOpacity(
                          opacity: _textVisible ? 1.0 : 0.0,
                          duration: Duration(milliseconds: 50),
                          child: MaterialButton(
                            minWidth: double.infinity,
                            onPressed: () => _onTap(),
                            child: Text(
                              'Started',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Align(
                  child: FadeAnimation(
                    delay: 1.3,
                    child: AnimatedOpacity(
                      opacity: _textVisible ? 1.0 : 0.0,
                      duration: Duration(milliseconds: 50),
                      child: Align(
                        child: Text(
                          'Now deliver to your door 24/7',
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
