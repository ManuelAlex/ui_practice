import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
 const Color secondaryColor =Color.fromARGB(255, 181, 139, 249);
void main() {


  runApp(const MyApp());
    // Set the status bar color
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: secondaryColor, 
      statusBarIconBrightness: Brightness.light, 
    ),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
   
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF9C53D6),
        toolbarHeight:0 ,
      
      ),
      body:const SafeArea(
        child: 
        
        Stack(
          children: [
            HomeBackground(),
            Align(
              alignment: Alignment.center,
            
                child: FloatingContent(),
                
            ),
          ],
        ),
        
        ),
    );
  }
}
class FloatingContent extends StatelessWidget {
  const FloatingContent({super.key});

  @override
  Widget build(BuildContext context) {

    const Color secondaryColor =Color.fromARGB(255, 181, 139, 249);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:  16.0),
      child: Container(
        height: 150,
        
      decoration:const BoxDecoration(
        color: Colors.white,
      
        borderRadius: BorderRadius.all(Radius.circular(16))
      ),
      
      
      child: const Padding(
        padding:  EdgeInsets.all(24),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
           
        children: [
          Column(
        
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: [
            FloatingChildrenContent(
              title: '100%',
              subTitle:'Completion' ,color:secondaryColor ,),
              FloatingChildrenContent(
                title:'13',
                subTitle:'Correct' ,color:Colors.greenAccent ,),
          ],),
           Column(
            
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FloatingChildrenContent(
              title: '20',
              subTitle:'Total Question' ,color:secondaryColor ,),
             
                FloatingChildrenContent(
                  title: '07',
                  subTitle:'Wrong' ,color:Colors.orangeAccent ,)
           ],),
        ] 
             ),
      ),
      ),
    );
  }
}

class FloatingChildrenContent extends StatelessWidget {
  const FloatingChildrenContent({
    required this.color,
    required this.title,
     required this.subTitle,
    super.key,
  });
  final Color color;
  final String title,subTitle;

  @override
  Widget build(BuildContext context) {
    const double size = 15;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: size,
          width: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(width: 8), 
        Column(
          mainAxisSize: MainAxisSize.min,
         // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(color: color,fontWeight: FontWeight.bold,fontSize: 16),
            ),
            Text(
              subTitle,
              style: TextStyle(color: Colors.black.withOpacity(0.5),fontWeight: FontWeight.w500,), // Fixed opacity
            ),
          ],
        ),
      ],
    );
  }
}


class HomeBackground extends StatelessWidget {
  const HomeBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
    children: [
      PurpleTopContent(),
      Expanded(child: WhiteBottomContent())
    ],
          );
  }
}
class PurpleTopContent extends StatelessWidget {
  const PurpleTopContent({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    
    Container(
      height: MediaQuery.sizeOf(context).height*0.45,
      decoration:const BoxDecoration(borderRadius: BorderRadius.vertical(
      bottom:Radius.circular(24), ),
            color:  Color(0xFF9D54D7),
      ),
      child:Stack(// used stack bc of the IconButton it has nothing to do with layouting
        children: [
           IconButton(
              icon:const Icon(Icons.arrow_back, size: 30.0,color: Colors.white,), // Back button icon
              onPressed: () {
              
              },
            ),
          CustomPaint(
            size: Size(double.infinity, MediaQuery.sizeOf(context).height*0.45),
            painter:CircleCustomPainter() ,
            child: const Center(child: CircleTopContent()),
          ),
        ],
      )
      
      
    );
  }
}
class CircleCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
   
    // Paint for the semi-circle
    Paint semiCirclePaint = Paint()
      ..color = Colors.white.withOpacity(0.1) 
      ..style = PaintingStyle.fill;

    // Draw semi-circle
      canvas.drawArc(
      Rect.fromLTWH(size.width / 1.18,size.height/3  , size.width /  3 , size.height / 2,), 
     pi / 2, 
      pi,
      true, 
      semiCirclePaint,
    );
// Draw semi-circle
      canvas.drawArc(
      Rect.fromLTWH(
        size.width / 4, 
        -size.height/5.3, 
        size.width / 3, 
        size.height / 3, 
      ),
      0, 
      pi,
      true, 
      semiCirclePaint,
    );

        canvas.drawArc(
      Rect.fromLTWH(
        -size.width/3.6, 
        -size.height/10.48, 
        size.width / 2, 
        size.height / 2, 
      ),
     - pi/2, 
      pi,
      true, 
      semiCirclePaint,
    );
    // Paint for tiny circles
    Paint tinyCirclePaint = Paint()
      ..color = Colors.white.withOpacity(0.1) 
      ..style = PaintingStyle.fill;

   
    double tinyCircleRadius = 28.0; 
   canvas.drawCircle(Offset(size.width/1.5, size.height/8), tinyCircleRadius, tinyCirclePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}


class WhiteBottomContent extends StatelessWidget {
  const WhiteBottomContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
     
      color:const Color.fromRGBO(250,250,250,255),
      child: const Padding(
        padding:  EdgeInsets.only(right:  32.0,left: 32,top: 32),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
            
          children: [
          Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    BottomWidget(iconData: Icons.replay, color: Color(0xFF5C94B9), title: 'Play Again'), 
    BottomWidget(iconData: Icons.visibility, color: Color(0xFFBB8E71), title: 'Review Answers'), 
    BottomWidget(iconData: Icons.share, color: Color(0xFFBB8E71), title: 'Share Score'), 
  ],
),
SizedBox(height: 24,),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  mainAxisSize: MainAxisSize.min,
  children: [
    BottomWidget(iconData: Icons.file_present, color: Color(0xFF0D9EEF), title: 'Generate Pdf'), 
    BottomWidget(iconData: Icons.home, color: Color(0xFFC196B2), title: 'Home'), 
    BottomWidget(iconData: Icons.rate_review_sharp, color: Color(0xFF747392), title: 'Leaderboard'),
  ],
),

          ],
        ),
      ),
    );
  }
}
class BottomWidget extends StatelessWidget {
  const BottomWidget({
    super.key,
    required this.iconData,
    required this.color,
    required this.title,
  });

  final IconData iconData;
  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,  
          ),
          child: Icon(
            iconData,
            color: Colors.white, 
            size: 32,
          ),
        ),
        const SizedBox(height: 8),
        Text(title),
      ],
    );
  }
}


class CircleTopContent extends StatelessWidget {
  const CircleTopContent({super.key});

  @override
  Widget build(BuildContext context) {
    const double outerCircleSize = 200;
    const double middleCircleSize = 150;
    const double topCircleSize = 130;

    return Center( 
      child: Stack(
        alignment: Alignment.center, 
        children: [
         
          Container(
            height: outerCircleSize,
            width: outerCircleSize, 
            decoration: const BoxDecoration(
              color: Color(0xFFB881E6), 
              shape: BoxShape.circle,
            ),
          ),
          // Middle Circle
          Container(
            height: middleCircleSize,
            width: middleCircleSize, 
            decoration: const BoxDecoration(
              color: Color(0xFFCA9FE4), 
              shape: BoxShape.circle,
            ),
          ),
          // Top Circle
          Container(
            height: topCircleSize,
            width: topCircleSize, 
            decoration: const BoxDecoration(
              color: Colors.white, 
              shape: BoxShape.circle,
            ),
            child:const Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('Your Score',style: TextStyle(color:Color(0xFFA965DC),fontWeight: FontWeight.bold,),),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
 // crossAxisAlignment: CrossAxisAlignment.end,
  children: [
    Text(
      '150',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
        color: Color(0xFF9D54D7)
      ),
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'pt',
          style: TextStyle(
            fontSize: 15, 
            textBaseline: TextBaseline.alphabetic, 
            fontWeight: FontWeight.bold,
            color: Color(0xFF9D54D7)
          ),
        ),
      ],
    ),
  ],
)

            ],
            ),
          ),
        ],
      ),
    );
  }
}

