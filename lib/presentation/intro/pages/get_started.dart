import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:melohub/core/configs/helpers/helper_functions.dart';
import '../../../common/widgets/button/basic_app_button.dart';
import '../../../core/assets/app_images.dart';
import '../../../core/assets/app_vectors.dart';
import '../../choose_mode/pages/choose_mode.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      AppImages.introLana,
                    )
                )
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.35),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: HelperFunctions.screenHeight(context) * 0.05,
                horizontal: HelperFunctions.screenWidth(context) * 0.1,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(
                      AppVectors.meloLogo,
                    height: 80,
                  ),
                ),
                const Spacer(),
                Text(
                  'Enjoy Listening To Music',
                  style: textTheme.headlineMedium!.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 16,),
                Text(
                  'Join us in celebrating the talent and passion of artists. Explore their music, feel the emotions, and embark on a journey through sound that will leave a lasting impression.',
                  style: textTheme.bodySmall!.copyWith(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16,),
                BasicAppButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => const ChooseModePage()
                          )
                      );
                    },
                    title: 'Get Started'
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}