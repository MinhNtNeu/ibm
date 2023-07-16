import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key, required this.number}) : super(key: key);
  final double number;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String result = '';
  String text ='';
  late String roundedNumber;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFF003366),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const Text('Your Result', style: TextStyle(
                color: Colors.white,
                fontFamily: 'SF Pro Text',
                fontWeight: FontWeight.w600,
                fontSize: 35,
              ),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 550,
                  width: 300,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.black26,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(result, style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                        ),),
                        const SizedBox(height: 32,),
                        Text(' ${widget.number.toStringAsFixed(2)}  ', style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.w600,
                          fontSize: 50,
                        ),),
                        const SizedBox(height: 64,),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(32, 8, 8, 0),
                          child: Text(text, style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                          ),),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              const _BtnWidget(),
            ],
          ),
        ),
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.number <= 18.5) {
      result = ' Thiếu cân';
    text ='Ăn nhiều lên 🙃';
    } else if( widget.number <= 24.9 ) {
      result = ' Cân đối';
      text =' Tiếp tục phát huy 😚 ';
    }
    else if ( widget.number <=29.9){
      result ='Thừa cân ';
      text =' Cần tiết chế ăn uống lại 😓';
    }
    else if (widget.number <=34.9){
      result ='Béo phì ';
      text =' Ăn vừa thôi!!!!! 🤢';
    }
    else if (  widget.number > 35){
      result =' Béo phì nguy hiểm';
      text = "If you don't stop eating, you'll die for sure?  🙂";
    }
  }
}

class _BtnWidget extends StatelessWidget {
  const _BtnWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkResponse(
        onTap: (){
      Navigator.pop(context);
    },
      child: Container(
        height: 50,
        color: Colors.teal,
        child: const Center(
          child: Text('RE-CALCULATE', style: TextStyle(
            color: Colors.white,
            fontFamily: 'SF Pro Text',
            fontWeight: FontWeight.w600,
            fontSize: 25,
          ),),
        ),
      ),
    );

  }
}

