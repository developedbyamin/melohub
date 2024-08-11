import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:melohub/core/configs/helpers/helper_functions.dart';
import 'package:melohub/presentation/choose_mode/pages/chose_mode_home.dart';
import '../../../common/widgets/appbar/app_bar.dart';
import '../../../core/assets/app_vectors.dart';
import '../widgets/news_songs.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.meloLogo,
          height: HelperFunctions.screenHeight(context) * 0.08,
        ),
        action: IconButton(
          onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const ChooseModeHomePage()
                )
            );
          },
          icon: const Icon(Icons.settings),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 16,
          ),
          _homeArtistCard(),
          const SizedBox(
            height: 16,
          ),
          _tabs(),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TabBarView(
                controller: _tabController,
                children: const [
                  NewsSongs(),
                  Center(
                    child: Text(
                      'Videos'
                    ),
                  ),
                  Center(
                    child: Text(
                        'Artists'
                    ),
                  ),
                  Center(
                    child: Text(
                        'Podcasts'
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _homeArtistCard() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: HelperFunctions.screenWidth(context),
        child: SvgPicture.asset(AppVectors.homeTopCard),
      ),
    );
  }

  Widget _tabs() {
    return TabBar(
      controller: _tabController,
      tabs: const [
        Text('News'),
        Text('Videos'),
        Text('Artists'),
        Text('Podcasts'),
      ],
    );
  }
}
