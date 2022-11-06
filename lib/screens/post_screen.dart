import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Stack(
          children: [
            Container(
              width: 428,
              height: 350,
              child: ClipRRect(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset('images/post4.png'),
                ),
              ),
            ),
            Positioned(
              top: 45,
              left: 20,
              right: 20,
              child: Row(
                children: [
                  Image.asset('images/arrow_right.png'),
                  Spacer(),
                  Row(
                    children: [
                      Image.asset('images/bookmark.png'),
                      SizedBox(width: 25),
                      Image.asset('images/short_Menu_horizontal.png'),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Expanded(child: Container()),
                Container(
                  height: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: Colors.white,
                  ),
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: _getHeader(),
                      ),
                      SliverToBoxAdapter(
                        child: _getTitle(),
                      ),
                      SliverToBoxAdapter(
                        child: _getTags(),
                      ),
                      SliverToBoxAdapter(
                        child: _getDescription1(),
                      ),
                      SliverToBoxAdapter(
                        child: _getDescription2(),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _getHeader() {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 30),
      child: Column(
        children: [
          Image.asset('images/home_indicator.png'),
          SizedBox(height: 27),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Image.asset('images/flash_circle.png'),
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
                ],
              ),
              Container(
                width: 117,
                height: 26,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: Colors.red,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/news_agency01_2.png'),
                    SizedBox(width: 7),
                    Text(
                      'خبرگزاری آخرین خبر',
                      style: TextStyle(
                        fontFamily: 'SB',
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffBFC3C8),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
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
        ],
      ),
    );
  }

  Widget _getTitle() {
    return Padding(
      padding: EdgeInsets.only(right: 23, bottom: 32),
      child: Text(
        'پاسخ منفی پورتو به چلسی برای جذب طارمی با طعم تهدید',
        style: TextStyle(
          fontFamily: 'SB',
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _getTags() {
    return Padding(
      padding: EdgeInsets.only(right: 23, bottom: 20),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Text(
              'فوتبال اروپا',
              style: TextStyle(
                  fontSize: 10,
                  fontFamily: 'SB',
                  color: Colors.red,
                  fontWeight: FontWeight.bold),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Color(0xffFFCDD8),
            ),
          ),
          SizedBox(width: 15),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Text(
              'لژیونر ها',
              style: TextStyle(
                  fontSize: 10,
                  fontFamily: 'SB',
                  color: Colors.red,
                  fontWeight: FontWeight.bold),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Color(0xffFFCDD8),
            ),
          ),
          SizedBox(width: 15),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Text(
              'ورزشی',
              style: TextStyle(
                  fontSize: 10,
                  fontFamily: 'SB',
                  color: Colors.red,
                  fontWeight: FontWeight.bold),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Color(0xffFFCDD8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getDescription1() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Text(
        'باشگاه چلسی که پیگیر جذب مهدی طارمی مهاجـم ایران بـود، با پاسـخ منفی باشگاه پورتو مواجه شد و این بازیـکن باوجود رویای بازی در لیگ برتر انگلیس فعلا در پرتغال ماندنی است',
        style: TextStyle(
            color: Colors.black,
            fontFamily: 'SB',
            fontSize: 14,
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _getDescription2() {
    return Container(
      padding: EdgeInsets.only(left: 25, right: 25, top: 20, bottom: 30),
      child: Column(
        children: [
          Text(
            'بحث پیشنهاد باشگاه چلسی انگلیس به پورتو برای جذب مهدی طارمی در آخرین ساعات نقل و انتقالات فوتبال اروپایکی از سوژه های اصلی هواداران دو تیم بود. این خبر در حالی رسانه ای شد که در رسانه های سراسردنیا گفته میشد چلسی برای جذب طارمی مبلغ 25 میلیون یوره را به پورتو پیشنهاد داده است.',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'SN',
              fontSize: 14,
            ),
            textAlign: TextAlign.justify,
          ),
          Text(
            ' روزنـامه «ابولا» پرتغال هم روز چهارشنـبـه ایــن خـبر را اعلـام کرد و به دنبال آن بعضی از مطبوعات انگلیس و کشورهای دیگر هم پیشنهاد چلسی به طارمی را دنبال کردند',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'SN',
              fontSize: 14,
            ),
            textAlign: TextAlign.justify,
          ),
          Text(
            ' طـارمـی در لـیـگ قـهـرمـانـان دو فــصـل پــیــش اروپـا و در دیـدار مـقـابـل چلسی عملکرد بی نظیری داشت و با یک گل قیچی برگردان، پورتو را به پیروزی رساند. هرچند که نماینده پرتـغال به خاطر مجموع نـتـایـج بازی رفت و برگشت حـذف شد. با ایـن حـال گـل طـارمـی حتـی تـا یک قـدمی انـتخـاب بهـترین گـل سـال فیـفا و دریـافـت جـایزه «پوشکاش» هم پیش رفت.',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'SN',
              fontSize: 14,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
