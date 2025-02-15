import 'dart:math';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:confetti/confetti.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  final _controller = ConfettiController();
  bool isPlaying = false;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('About', style: TextStyle(fontSize: 25)),
            centerTitle: true,
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ZoomIn(
                      child: const CircleAvatar(
                        radius: 130,
                        backgroundImage: AssetImage('assets/images/icon.png'),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'VITB Mess',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'v1.1.3',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "App aims to make it easier for\nVIT Bhopal University Students\nto find the correct food item\navailable at the mess based on\nthe current day and time",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Developed by Paras Shenmare\n Made with 💚 in Flutter',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () {
                        launchUrlString(
                            "mailto:shenmareparas+vitbmess@gmail.com?subject=VIT%20Bhopal%20Mess%20Feedback");
                      },
                      child: const IntrinsicWidth(
                        child: Row(
                          children: [
                            Text('Send Feedback   '),
                            Icon(Icons.send_rounded)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    ElevatedButton(
                      onPressed: () {
                        if (isPlaying) {
                          _controller.stop();
                        } else {
                          _controller.play();
                        }
                        isPlaying = !isPlaying;
                      },
                      child: const IntrinsicWidth(
                        child: Row(
                          children: [
                            Text('1.5K+ Downloads  '),
                            Icon(Icons.celebration_rounded)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        ConfettiWidget(
          confettiController: _controller,
          blastDirection: pi / 2,
          gravity: 0.01,
          emissionFrequency: 0.07,
          colors: const [
            Colors.lightGreenAccent,
            Colors.lightGreen,
            Colors.green,
            Colors.white,
          ],
        ),
      ],
    );
  }
}
