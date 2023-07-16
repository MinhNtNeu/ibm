import 'package:bmi/result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF003366),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _AppBarWidget(),
              SizedBox(
                height: 16,
              ),
              _MaleFemaleWidget(),
              SizedBox(
                height: 16,
              ),
               _SlideWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _AppBarWidget extends StatelessWidget {
  const _AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.cyan,
      child: const Center(
        child: Text(
          'BMI CALCULATOR', style: TextStyle(
          color: Colors.white,
          fontFamily: 'SF Pro Text',
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
        ),
      ),
    );
  }
}

class _MaleFemaleWidget extends StatefulWidget {
  const _MaleFemaleWidget({Key? key}) : super(key: key);

  @override
  State<_MaleFemaleWidget> createState() => _MaleFemaleWidgetState();
}

class _MaleFemaleWidgetState extends State<_MaleFemaleWidget> {
  bool basic = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 8, 32, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                basic = !basic;
              });
            },
            child: Container(
              width: 130,
              height: 150,
              decoration: const BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/male.svg',
                      width: 70,
                      height: 70,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'MALE',
                      style: TextStyle(
                        color: !basic ? Colors.black26 : Colors.white,
                        fontFamily: 'SF Pro Text',
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                basic = !basic;
              });
            },
            child: Container(
              width: 130,
              height: 150,
              decoration: const BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/female.svg',
                      width: 70,
                      height: 70,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'FEMALE',
                      style: TextStyle(
                        color: basic ? Colors.black26 : Colors.white,
                        fontFamily: 'SF Pro Text',
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _SlideWidget extends StatefulWidget {
  const _SlideWidget({Key? key}) : super(key: key);

  @override
  State<_SlideWidget> createState() => _SlideWidgetState();
}

class _SlideWidgetState extends State<_SlideWidget> {
  double _currentSliderValue = 0;
  int counter = 0;
  int count = 0;
  double result = 0;
  void _calculate(String operator) {
    setState(() {
      if (operator == '+') {
        counter++;
      } else if (operator == '-') {
        counter--;
      }
    });
  }

  void _age(String operator) {
    setState(() {
      if (operator == '+') {
        count++;
      } else if (operator == '-') {
        count--;
      }
    });
  }

  void _bmi() {
    setState(() {
      result = counter /( (_currentSliderValue * _currentSliderValue)/(100*100));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Column(
        children: [
          _heightwidget(),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _weightWidget(),
              _ageWidget(),
            ],
          ),
          const SizedBox(height: 32,),
          _btnWidget(),
        ],
      ),
    );
  }

  Widget _heightwidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        decoration: const BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             const Text('Height',style: TextStyle(
          color: Colors.white38,
          fontFamily: 'SF Pro Text',
          fontWeight: FontWeight.w600,
          fontSize: 20,),),
            const SizedBox(
              height: 4,
            ),
            Text('$_currentSliderValue cm',style: const TextStyle(
              color: Colors.white,
              fontFamily: 'SF Pro Text',
              fontWeight: FontWeight.w500,
              fontSize: 35,),),
            Slider(
              value: _currentSliderValue,
              max: 200,
              divisions: 200,
              label: _currentSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _weightWidget() {
    return Container(
        width: 150,
        height: 150,
        decoration: const BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            const Text('WEIGHT',style: TextStyle(
              color: Colors.white38,
              fontFamily: 'SF Pro Text',
              fontWeight: FontWeight.w600,
              fontSize: 15,),),
            Text('$counter',style: const TextStyle(
              color: Colors.white,
              fontFamily: 'SF Pro Text',
              fontWeight: FontWeight.w600,
              fontSize: 35,),),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
              GestureDetector(
                onTap: () {
                  _calculate('-');
                },
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.black26,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset('assets/tru.svg'),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              GestureDetector(
                onTap: () {
                  _calculate('+');
                },
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.black26,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset('assets/cong.svg'),
                  ),
                ),
              ),
            ])
          ]),
        ));
  }

  Widget _ageWidget() {
    return Container(
        width: 150,
        height: 150,
        decoration: const BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            const Text('AGE',style: TextStyle(
              color: Colors.white38,
              fontFamily: 'SF Pro Text',
              fontWeight: FontWeight.w600,
              fontSize: 15,),),
            Text('$count',style: const TextStyle(
              color: Colors.white,
              fontFamily: 'SF Pro Text',
              fontWeight: FontWeight.w600,
              fontSize: 35,),),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
              GestureDetector(
                onTap: () {
                  _age('-');
                },
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.black26,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset('assets/tru.svg'),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              GestureDetector(
                onTap: () {
                  _age('+');
                },
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.black26,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset('assets/cong.svg'),
                  ),
                ),
              ),
            ])
          ]),
        ));
  }

  Widget _btnWidget() {
    
    return InkResponse(
      onTap: () {
        _bmi();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ResultPage(
                      number: result,
                    )));
      },
      child: Container(
        height: 50,
        color: Colors.teal,
        child: const Center(
          child: Text('CALCULATE',style: TextStyle(
            color: Colors.white,
            fontFamily: 'SF Pro Text',
            fontWeight: FontWeight.w600,
            fontSize: 20,),),
        ),
      ),
    );
  }
}
