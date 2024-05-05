import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio/services/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .1,
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child:
                  Consumer<ThemeProvider>(builder: (context, provider, child) {
                return Switch(
                  value: provider.currentTheme == 'dark',

                  activeThumbImage: AssetImage(
                    'assets/images/moon.gif',
                  ),
                  inactiveThumbImage: AssetImage(
                    'assets/images/sun.gif',
                  ),
                  //inactiveThumbColor: Colors.amberAccent,
                  onChanged: (bool value) {
                    provider.changeTheme(value ? 'dark' : 'light');
                  },
                );
              }),
              // Consumer<ThemeProvider>(
              //   builder: (context, provider, child) {
              //     return DropdownButton<String>(
              //       value: provider.currentTheme,
              //       items: [
              //         DropdownMenuItem<String>(
              //           value: 'light',
              //           child: Text(
              //             'Light',
              //             style: Theme.of(context).textTheme.headlineMedium,
              //           ),
              //         ),
              //         DropdownMenuItem<String>(
              //           value: 'dark',
              //           child: Text(
              //             'Dark',
              //             style: Theme.of(context).textTheme.headlineMedium,
              //           ),
              //         ),
              //         DropdownMenuItem<String>(
              //           value: 'system',
              //           child: Text(
              //             'System',
              //             style: Theme.of(context).textTheme.headlineMedium,
              //           ),
              //         ),
              //       ],
              //       onChanged: (String? value) {
              //         provider.changeTheme(value ?? 'system');
              //       },
              //     );
              //   },
              // ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .03),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage(
                        'assets/images/pic2.jpg'), // Add your profile picture asset
                  ),
                  SizedBox(height: 40),
                  Text(
                    'Tamojit Ghosh',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .center, // Align text to the start (left) side
                    children: [
                      Text(
                        'Computer Science Undergrad',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                          height:
                              5), // Add some vertical space between the two text widgets
                      Text(
                        'STCET, Kolkata, India',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),

                  SizedBox(height: 30),
                  //animatedswitcher is used for smooth transition between themes
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 500),
                    //key is used to distinguish between themes
                    key: Key(
                      Theme.of(context).brightness.toString(),
                    ),
                    child: Wrap(
                      spacing: 20,
                      children: [
                        IconButton(
                          icon: Image.asset(
                            Theme.of(context).brightness == Brightness.light
                                ? 'assets/images/leetcode.png'
                                : 'assets/images/leetcode_dark.png',
                            height: 35,
                            width: 35,
                          ),
                          tooltip: 'Leetcode',
                          onPressed: () {
                            launch('https://leetcode.com/u/rhobustdev/');
                          },
                        ),
                        IconButton(
                          icon: Image.asset(
                            Theme.of(context).brightness == Brightness.light
                                ? 'assets/images/github.png'
                                : 'assets/images/github_dark.png',
                            height: 35,
                            width: 35,
                          ),
                          tooltip: 'Github',
                          onPressed: () {
                            launch('https://github.com/tamojitalwaysghosh');
                          },
                        ),
                        IconButton(
                          icon: Image.asset(
                            Theme.of(context).brightness == Brightness.light
                                ? 'assets/images/linkedin.png'
                                : 'assets/images/linkedin_dark.png',
                            height: 35,
                            width: 35,
                          ),
                          tooltip: 'LinkedIn',
                          onPressed: () {
                            launch(
                                'https://www.linkedin.com/in/tamojit-ghosh-2851b8213/');
                          },
                        ),
                        IconButton(
                          icon: Image.asset(
                            Theme.of(context).brightness == Brightness.light
                                ? 'assets/images/resume.png'
                                : 'assets/images/resume_dark.png',
                            height: 35,
                            width: 35,
                          ),
                          tooltip: 'Resume',
                          onPressed: () {
                            launch(
                                'https://drive.google.com/file/d/1Ff5WXMxjQt65kkDGlLKUCivTIJ2T4eta/view?usp=sharing');
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
