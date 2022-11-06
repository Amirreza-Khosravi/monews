import 'package:flutter/material.dart';
import 'package:monews/screens/fallowing_Screen.dart';
import 'package:monews/screens/post_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 233, 232, 232),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: _getAppBar(),
            ),
            SizedBox(height: 20),
            Container(
              width: 365,
              height: 43,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(21),
              ),
              child: _getTabBar(),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  fallowingScreen(),
                  _getViewSuggestion(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getAppBar() {
    return Padding(
      padding: EdgeInsets.only(top: 13),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          children: [
            Image.asset('images/notification_status.png'),
            Spacer(
              flex: 4,
            ),
            Image.asset("images/monews.png"),
            Spacer(
              flex: 5,
            ),
          ],
        ),
      ),
    );
  }

  Widget _getTabBar() {
    return TabBar(
      controller: _tabController,
      labelStyle: TextStyle(
        fontFamily: 'SB',
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      labelColor: Colors.white,
      unselectedLabelColor: Color(0xffBFC3C8),
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(17.5),
        color: Color(0xffFF033E),
      ),
      tabs: [
        Tab(
          text: 'دنبال میکنید',
        ),
        Tab(
          text: 'پیشنهادی',
        ),
      ],
    );
  }

  Widget _getViewSuggestion() {
    return Column(
      children: [
        _getHeaderPostSuggestion(),
        SizedBox(height: 24),
        _getPostSuggestion(),
        _getHeaderNewsInterested(),
        _getPostInterested(),
      ],
    );
  }

  Widget _getHeaderPostSuggestion() {
    return Padding(
      padding: EdgeInsets.only(right: 35, left: 24, top: 20),
      child: Row(
        children: [
          Text(
            'مشاهده بیشتر',
            style: TextStyle(
              fontSize: 12,
              fontFamily: 'SB',
              fontWeight: FontWeight.bold,
              color: Color(0xffFF033E),
            ),
          ),
          Spacer(),
          Text(
            'خبر های داغ',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'SB',
              fontWeight: FontWeight.bold,
              color: Color(0xff1C1F2E),
            ),
          ),
        ],
      ),
    );
  }

  _getPostSuggestion() {
    return Container(
      padding: EdgeInsets.only(right: 24),
      height: 294,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 20),
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Container(
                  width: 279,
                  height: 294,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 4),
                  width: 271,
                  height: 159,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.push(context,
                                MaterialPageRoute(builder: ((context) {
                              return PostScreen();
                            })));
                          });
                        },
                        child: Image.asset(
                            _getImageNews()[index < 3 ? index : index ~/ 2]),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    width: 58,
                    height: 28,
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color.fromARGB(255, 151, 0, 35),
                    ),
                    child: Text(
                      'ورزشی',
                      style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'SB',
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Positioned(
                  top: 190,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    width: 279,
                    height: 159,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Row(
                              children: [
                                Text(
                                  '۵ دقیقه قبل',
                                  style: TextStyle(
                                    fontFamily: 'SB',
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffBFC3C8),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Text(
                                  'پیشنهاد مونیوز',
                                  style: TextStyle(
                                    fontFamily: 'SB',
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffBFC3C8),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Image.asset('images/flash_circle.png'),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 20),
                          child: Text(
                            _getCaptionNews()[index < 3 ? index : index ~/ 2],
                            style: TextStyle(
                                fontFamily: 'SB',
                                fontSize: 14,
                                color: Colors.black),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Image.asset('images/short_Menu.png'),
                              ],
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Text(
                                  'خبرگزاری آخرین خبر',
                                  style: TextStyle(
                                    fontFamily: 'SB',
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffBFC3C8),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(width: 7),
                                Image.asset('images/Ellipse1.png'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _getHeaderNewsInterested() {
    return Padding(
      padding: EdgeInsets.only(right: 35, left: 24, top: 35),
      child: Row(
        children: [
          Text(
            'مشاهده بیشتر',
            style: TextStyle(
              fontSize: 12,
              fontFamily: 'SB',
              fontWeight: FontWeight.bold,
              color: Color(0xffFF033E),
            ),
          ),
          Spacer(),
          Text(
            'خبر هایی که علاقه داری',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'SB',
              fontWeight: FontWeight.bold,
              color: Color(0xff1C1F2E),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getPostInterested() {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: 350,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                    child: Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: [
                        Container(
                          width: 380,
                          height: 132,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            width: 116,
                            height: 116,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ClipRRect(
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Image.asset(_getImageInterested()[
                                    index < 3 ? index : index ~/ 2]),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 130,
                          child: Container(
                            width: 230,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 226,
                                      height: 45,
                                      child: Text(
                                        _getCaptionInterested()[
                                            index < 3 ? index : index ~/ 2],
                                        style: TextStyle(
                                          fontFamily: 'SB',
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Container(
                                  width: 226,
                                  height: 45,
                                  child: Text(
                                    _getMoreInformation()[
                                        index < 3 ? index : index ~/ 2],
                                    style: TextStyle(
                                      fontFamily: 'SB',
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffBFC3C8),
                                    ),
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                                SizedBox(
                                  width: 380,
                                  child: Row(
                                    children: [
                                      SizedBox(width: 14),
                                      Row(
                                        children: [
                                          Image.asset('images/short_Menu.png'),
                                        ],
                                      ),
                                      Spacer(),
                                      Row(
                                        children: [
                                          Text(
                                            'خبرگزاری دیجیاتو',
                                            style: TextStyle(
                                              fontFamily: 'SB',
                                              fontSize: 8,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(width: 10),
                                          Image.asset('images/Ellipse2.png'),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  List<String> _getCaptionNews() {
    return <String>[
      '           بازگشت زودهنگام لوا به آلیانس آرنا',
      'پای اژدها به گلزنی باز شد , اولین گل لوکاتیا به صنعت نفت آبادان',
      'پاسخ منفی پورتو به چلسی برای جذب طارمی با طعم تهدید',
    ];
  }

  List<String> _getImageNews() {
    return <String>[
      'images/post2.jpg',
      'images/post5.jpg',
      'images/post4.png',
    ];
  }

  List<String> _getCaptionInterested() {
    return <String>[
      'از مشخصات فنی تا قیمت; هرآنچه تا به امروز درباره آیفون 14 اپل میدانیم',
      'ساعت هوشمند گارمین با عمر باتری 11 روزه معرفی شد',
      'ساعت هوشمند گارمین با عمر باتری 11 روزه معرفی شد',
    ];
  }

  List<String> _getImageInterested() {
    return <String>[
      'images/news_interest2.png',
      'images/news_interest.png',
      'images/news_interest2.png',
    ];
  }

  List<String> _getMoreInformation() {
    return <String>[
      'در این مطلب نگاهی به تمام گزارش ها و شایعات پیرامون گوشی های سری آیفون 14 اپل میپردازیم',
      '''گارمین در رویداد IFA ۲۰۲۲ ساعت هوشمند Venu Sq 2 و ردیاب سلامت 
کودکان موسوم به Black Panther Vivofit Jr 3 را معرفی کرد.''',
      'در این مطلب نگاهی به تمام گزارش ها و شایعات پیرامون گوشی های سری آیفون 14 اپل میپردازیم',
    ];
  }
}
