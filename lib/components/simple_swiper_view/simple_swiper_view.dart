import 'package:flutter/widgets.dart';

class SimpleSwiperView extends StatefulWidget {
  SimpleSwiperView({Key? key}) : super(key: key);

  @override
  _SimpleSwiperViewState createState() => _SimpleSwiperViewState();
}

class _SimpleSwiperViewState extends State<SimpleSwiperView> {
  late PageController pageController;

  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();

    pageController = new PageController(
        initialPage: 0, keepPage: true, viewportFraction: 0.8);

    ///PageView设置滑动监听
    // pageController.addListener(() {
    //   //PageView滑动的距离
    //   double offset = pageController.offset;
    //   //当前显示的页面的索引
    //   double page = pageController.page;
    //   print("pageView 滑动的距离 $offset  索引 $page");
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 300,
      height: 230,
      child: Stack(
        children: [_buildBannerPageView()],
      ),
    );
  }

  _buildBannerPageView() {
    return PageView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Image.asset(
          'assets/images/undraw_design_notes_8dmv.png',
          fit: BoxFit.cover,
        );
      },
      itemCount: 3,
      controller: pageController,
      onPageChanged: (int index) {
        print("当前的页面是 $index");
        setState(() {
          currentPageIndex = index;
        });
      },
    );
  }
}
