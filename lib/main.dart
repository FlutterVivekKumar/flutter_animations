import 'package:animation/custom_loaders/wave_loader.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'custom_dialog_box/custom_dialog_box.dart';
import 'custom_loaders/indicator.dart';

extension HexColor on String {
  Color toColor() {
    final hexCode = this.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Profile Card',
      home: ProfileCard(),
    );
  }
}

class ProfileCard extends StatefulWidget {
  const ProfileCard({super.key});

  @override
  _ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard>
    with TickerProviderStateMixin {
  late AnimationController _controller, controller;

  late Tween<double> transformTwenn,
      animatedTweenWidth,
      animatedTweenHeight,
      leftWidthTween,
      heightTween,
      secondTween,
      firstTween,
      transformTwenn1,
      animatedTweenWidth1,
      animatedTweenHeight1,
      leftWidthTween1,
      heightTween1,
      secondTween1,
      firstTween1;
  late Animation transformAnimation,
      scaleAnimation,
      animatedWidth,
      animatedHeight,
      leftWidthAnimation,
      heightAnimation,
      secondAnimation,
      firstAnimation,
      transformAnimation1,
      scaleAnimation1,
      animatedWidth1,
      animatedHeight1,
      leftWidthAnimation1,
      heightAnimation1,
      secondAnimation1,
      firstAnimation1;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..addListener(() {
        setState(() {});
      });
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..addListener(() {
        setState(() {});
      });

    firstTween = Tween(begin: 5, end: 20);
    firstAnimation = firstTween.animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.200,
          0.7,
        )));
    secondTween = Tween(begin: 5, end: 10);
    secondAnimation = secondTween.animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.100,
          0.300,
        )));
    leftWidthTween = Tween(begin: 40, end: 340);
    leftWidthAnimation = leftWidthTween.animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.125,
          0.200,
        )));

    scaleAnimation = TweenSequence([
      TweenSequenceItem<double>(tween: Tween(begin: 0, end: 1), weight: 80),
    ]).animate(_controller);
    super.initState();

    heightTween = Tween(begin: 40, end: 800);
    heightAnimation = heightTween.animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.125,
          0.200,
        )));

    firstTween1 = Tween(begin: 5, end: 20);
    firstAnimation1 = firstTween1.animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.200,
          0.7,
        )));
    secondTween1 = Tween(begin: 5, end: 10);
    secondAnimation1 = secondTween1.animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.100,
          0.300,
        )));
    leftWidthTween1 = Tween(begin: 40, end: 340);
    leftWidthAnimation1 = leftWidthTween1.animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.125,
          0.200,
        )));

    scaleAnimation1 = TweenSequence([
      TweenSequenceItem<double>(tween: Tween(begin: 0, end: 1), weight: 80),
    ]).animate(controller);
    super.initState();

    heightTween1 = Tween(begin: 40, end: 800);
    heightAnimation1 = heightTween1.animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.125,
          0.200,
        )));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  //Created by Yoqedo

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: '#B3C8CF'.toColor(),
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Stack(
                children: [
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Scaled Dialog',
                        recognizer: TapGestureRecognizer()
                          ..onTap =
                              () => showAnimatedDialogBox(context: context),
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: '\n\nSlide Down Dialog',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () =>
                                  showAnimatedSlideDialogBox(context: context),
                            style: const TextStyle(),
                          ),
                          TextSpan(
                            text: '\n\nSpinning Dialog',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => showAnimatedSpinningDialogBox(
                                  context: context),
                            style: const TextStyle(),
                          ),
                          TextSpan(
                            text: '\n\nBouncing Progress Dialog',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () =>
                                  showAnimatedSlideProgressDialogBox(
                                      context: context),
                            style: const TextStyle(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  _ProfileCard(
                      firstAnimation: firstAnimation,
                      secondAnimation: secondAnimation,
                      scaleAnimation: scaleAnimation,
                      leftWidthAnimation: leftWidthAnimation,
                      heightAnimation: heightAnimation),
                  _ProfileCard2(
                      firstAnimation: firstAnimation1,
                      secondAnimation: secondAnimation1,
                      scaleAnimation: scaleAnimation1,
                      leftWidthAnimation: leftWidthAnimation1,
                      heightAnimation: heightAnimation1),
                  Positioned(
                    top: 3,
                    right: 3,
                    child: _Avatar(
                      controller: controller,
                      secondControllerReverse: () {
                        _controller.reset();
                      },
                    ),
                  ),
                  Positioned(
                    top: 3,
                    left: 3,
                    child: _Avatar(
                      controller: _controller,
                      secondControllerReverse: () {
                        controller.reset();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//ProfilCard in all the Widget Inside
class _ProfileCard extends StatelessWidget {
  const _ProfileCard({
    Key? key,
    required this.firstAnimation,
    required this.secondAnimation,
    required this.scaleAnimation,
    required this.leftWidthAnimation,
    required this.heightAnimation,
  }) : super(key: key);

  final Animation firstAnimation;
  final Animation secondAnimation;
  final Animation scaleAnimation;
  final Animation leftWidthAnimation;
  final Animation heightAnimation;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: firstAnimation.value,
      left: secondAnimation.value,
      child: Transform.scale(
        alignment: Alignment.topLeft,
        scale: scaleAnimation.value,
        child: Container(
          width: leftWidthAnimation.value,
          height: heightAnimation.value,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 6,
                color: Colors.black38.withOpacity(0.3),
                spreadRadius: 0.5,
                offset: const Offset(0, 0),
              )
            ],
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 47,
                      backgroundColor: Colors.blue,
                      child: CircleAvatar(
                        radius: 45.0,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 40.0,
                          child: FlutterLogo(
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          'Flutter Animation',
                          style: TextStyle(
                            color: Color.fromRGBO(82, 76, 79, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'By Vivek Kumar',
                          style: TextStyle(
                            color: Color.fromRGBO(158, 156, 157, 1),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const Divider(
                  color: Color.fromRGBO(234, 232, 233, 1),
                  thickness: 1,
                ),
                ...List.generate(
                    13,
                    (index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            children: [
                              const Icon(Icons.person, color: Colors.blue),
                              const SizedBox(width: 10),
                              Text(
                                'Title $index',
                                style: const TextStyle(
                                  color: Color.fromRGBO(107, 107, 107, 1),
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        )),
                const Divider(
                  color: Color.fromRGBO(234, 232, 233, 1),
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    children: const [
                      Text(
                        'Log Out',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ProfileCard2 extends StatelessWidget {
  const _ProfileCard2({
    Key? key,
    required this.firstAnimation,
    required this.secondAnimation,
    required this.scaleAnimation,
    required this.leftWidthAnimation,
    required this.heightAnimation,
  }) : super(key: key);

  final Animation firstAnimation;
  final Animation secondAnimation;
  final Animation scaleAnimation;
  final Animation leftWidthAnimation;
  final Animation heightAnimation;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 1,
      // left: secondAnimation.value,
      child: Transform.scale(
        alignment: Alignment.centerLeft,
        scale: scaleAnimation.value,
        child: Container(
          width: leftWidthAnimation.value,
          height: MediaQuery.of(context).size.height - 25,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 6,
                color: Colors.black38.withOpacity(0.3),
                spreadRadius: 0.5,
                offset: const Offset(0, 0),
              )
            ],
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 47,
                      backgroundColor: Colors.blue,
                      child: CircleAvatar(
                        radius: 45.0,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 40.0,
                          child: FlutterLogo(
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          'Flutter Animation',
                          style: TextStyle(
                            color: Color.fromRGBO(82, 76, 79, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'By Vivek Kumar',
                          style: TextStyle(
                            color: Color.fromRGBO(158, 156, 157, 1),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const Divider(
                  color: Color.fromRGBO(234, 232, 233, 1),
                  thickness: 1,
                ),
                ...List.generate(
                    13,
                    (index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            children: [
                              const Icon(Icons.person, color: Colors.blue),
                              const SizedBox(width: 10),
                              Text(
                                'Title $index',
                                style: const TextStyle(
                                  color: Color.fromRGBO(107, 107, 107, 1),
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        )),
                const Divider(
                  color: Color.fromRGBO(234, 232, 233, 1),
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    children: const [
                      Text(
                        'Log Out',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//Navigation Menu on the Top
class _MenuPanel extends StatelessWidget {
  const _MenuPanel({
    Key? key,
    required AnimationController controller,
  })  : _controller = controller,
        super(key: key);

  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 5,
      left: 3,
      right: 3,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            _Avatar(
              controller: _controller,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

//CircleAvatar NavigationPanel
class _Avatar extends StatelessWidget {
  const _Avatar(
      {Key? key,
      required AnimationController controller,
      this.secondControllerReverse})
      : _controller = controller,
        super(key: key);

  final AnimationController _controller;
  final VoidCallback? secondControllerReverse;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
          onTap: () {
            if (_controller.isCompleted) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
            secondControllerReverse!();
          },
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Colors.black38.withOpacity(0.3),
                  spreadRadius: 0.5,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.menu,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
