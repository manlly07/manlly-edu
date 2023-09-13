import 'package:edu/constants/color.dart';
import 'package:edu/constants/images.dart';
import 'package:edu/models/course.dart';
import 'package:edu/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:edu/constants/size.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({Key? key}) : super(key: key);

  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntrinsicHeight(
                  child: Stack(
                    children: [
                      Align(
                        child: Text(
                          'Tiếng Việt',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        child: CustomIconButton(
                          child: const Icon(Icons.arrow_back),
                          height: 35,
                          width: 35,
                          onTap: () => Navigator.pop(context),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(imBg),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.85,
                          // crossAxisSpacing: 20,
                          // mainAxisSpacing: 24,
                        ),
                        itemBuilder: (context, index) {
                          return CourseContainer(course: courses[index], position: index);
                        },
                        itemCount: courses.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CourseContainer extends StatelessWidget {
  final Course course;
  final int position;
  const CourseContainer({
    Key? key,
    required this.course,
    required this.position,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailsScreen(
                    title: course.name,
                  ))),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.transparent,
        ),
        padding: const EdgeInsets.all(10),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.1),
                blurRadius: 4.0,
                spreadRadius: .05,
              ), //BoxShadow
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  course.thumbnail,
                  height: kCategoryCardImageSize,
                ),
              ),
              // const SizedBox(
              //   height: 10,
              // ),
              Center(
                child: Text(
                  course.name,
                  style: TextStyle(
                    fontSize: 30
                  ),
                  // style: ,
                ),
              ),
              // Text(
              //   "${category.noOfCourses.toString()} courses",
              //   style: Theme.of(context).textTheme.bodySmall,
              // ),
            ],
          ),
        ),

        // child: Row(
        //   // crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     ClipRRect(
        //       borderRadius: BorderRadius.circular(10),
        //       child: Image.asset(
        //         course.thumbnail,
        //         // width: 150,
        //         height: 150,
        //       ),
        //     ),
        //
        //     // if (position.isEven)
        //     //   Expanded(
        //     //     child: Column(
        //     //       crossAxisAlignment: CrossAxisAlignment.start,
        //     //       // children: [
        //     //       //   Stack(
        //     //       //     children: [
        //     //       //       ClipRRect(
        //     //       //         borderRadius: BorderRadius.circular(10),
        //     //       //         child: Image.asset(
        //     //       //           course.thumbnail,
        //     //       //           height: 100,
        //     //       //         ),
        //     //       //       ),
        //     //       //       Positioned(
        //     //       //           left: 0,
        //     //       //           right: 0,
        //     //       //           top: 0,
        //     //       //           bottom: 0,
        //     //       //           child: Align(
        //     //       //         // alignment: Alignment.center,
        //     //       //         child: Text(
        //     //       //           "Hello"
        //     //       //         ),
        //     //       //       ))
        //     //       //     ],
        //     //       //   ),
        //     //       //   SizedBox(height: 10)
        //     //       // ],
        //     //       // children: [
        //     //       //   ClipRRect(
        //     //       //     borderRadius: BorderRadius.circular(10),
        //     //       //     child: Image.asset(
        //     //       //       course.thumbnail,
        //     //       //       // width: 150,
        //     //       //       height: 150,
        //     //       //     ),
        //     //       //   ),
        //     //       //   // SizedBox(height: 10),
        //     //       //   // Image.asset(imLeft),
        //     //       // ],
        //     //     ),
        //     //   ),
        //     // if (!position.isEven)
        //     //   Expanded(
        //     //     child: Column(
        //     //       crossAxisAlignment: CrossAxisAlignment.end,
        //     //       // children: [
        //     //       //   Stack(
        //     //       //     children: [
        //     //       //       ClipRRect(
        //     //       //         borderRadius: BorderRadius.circular(10),
        //     //       //         child: Image.asset(
        //     //       //           course.thumbnail,
        //     //       //           height: 100,
        //     //       //         ),
        //     //       //       ),
        //     //       //       Positioned(
        //     //       //           left: 0,
        //     //       //           right: 0,
        //     //       //           top: 0,
        //     //       //           bottom: 0,
        //     //       //           child: Align(
        //     //       //             // alignment: Alignment.center,
        //     //       //             child: Text(
        //     //       //                 "Hello"
        //     //       //             ),
        //     //       //           ))
        //     //       //     ],
        //     //       //   ),
        //     //       //   SizedBox(height: 10)
        //     //       // ],
        //     //       children: [
        //     //         ClipRRect(
        //     //           borderRadius: BorderRadius.circular(10),
        //     //           child: Image.asset(
        //     //             course.thumbnail,
        //     //             height: 150,
        //     //           ),
        //     //         ),
        //     //         SizedBox(height: 10)
        //     //       ],
        //     //     ),
        //     //   ),
        //   ],
        // ),
      ),
    );
  }
  // Widget build(BuildContext context) {
  //   return GestureDetector(
  //     onTap: () => Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) => DetailsScreen(
  //               title: course.name,
  //             ))),
  //     child: Container(
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(10),
  //         color: Colors.white,
  //       ),
  //       padding: const EdgeInsets.all(10),
  //       child: Row(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           ClipRRect(
  //             borderRadius: BorderRadius.circular(10),
  //             child: Image.asset(
  //               course.thumbnail,
  //               height: 60,
  //             ),
  //           ),
  //           const SizedBox(
  //             width: 10,
  //           ),
  //           Expanded(
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(course.name),
  //                 Text(
  //                   "Author ${course.author}",
  //                   style: Theme.of(context).textTheme.bodySmall,
  //                 ),
  //                 const SizedBox(
  //                   height: 5,
  //                 ),
  //                 LinearProgressIndicator(
  //                   value: course.completedPercentage,
  //                   backgroundColor: Colors.black12,
  //                   color: kPrimaryColor,
  //                 )
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
