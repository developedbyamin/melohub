import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:melohub/presentation/auth/pages/signin.dart';
import 'package:melohub/presentation/auth/pages/signup.dart';
import '../../../common/widgets/appbar/app_bar.dart';
import '../../../common/widgets/button/basic_app_button.dart';
import '../../../core/assets/app_vectors.dart';


class SignUpSignInPage extends StatelessWidget {
  const SignUpSignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Stack(
        children: [
          const BasicAppBar(),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
              AppVectors.topPattern,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(
              AppVectors.bottomPattern,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppVectors.meloLogo, height: 200,),
                  Text(
                    'Enjoy Listening To Music',
                    style: textTheme.headlineMedium,
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  Text(
                    'Join us in celebrating the talent and passion of artists. Explore their music, feel the emotions, and embark on a journey through sound that will leave a lasting impression.',
                    style: textTheme.bodyMedium!.copyWith(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: BasicAppButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        SignUpPage()));
                          },
                          title: 'Register',
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        flex: 1,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    SignInPage(),
                              ),
                            );
                          },
                          child: Text(
                            'Sign in',
                            style: textTheme.bodyLarge
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
