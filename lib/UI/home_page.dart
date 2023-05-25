// ignore_for_file: unused_import

import 'dart:developer';
import 'package:banao_ui/provider/programprovider.dart';
import 'package:image_card/image_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/lessonsmodel.dart';
import '../model/programmodel.com.dart';
import '../provider/lessonsprovider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Programs? programValue;
  Lessons? lessonValue;

  @override
  void initState() {
    
    super.initState();
    Future.microtask(() async {
      await programListing();
      await lessonListing();
    });
  }

  Future<void> programListing() async {
    final myProvider = Provider.of<ProgramProvider>(context, listen: false);
    programValue = await myProvider.fetchProgramData();
  }

  Future<void> lessonListing() async {
    final myProvider = Provider.of<LessonsProvider>(context, listen: false);
    lessonValue = await myProvider.fetchLessonData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<ProgramProvider, LessonsProvider>(
        builder: (context, programsnap, lessonsnap, _) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: SingleChildScrollView(
            child: SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.short_text,
                        color: Colors.grey,
                      )),
                  const SizedBox(
                    width: 200,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.forum_outlined,
                        color: Colors.grey,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications_none_outlined,
                        color: Colors.grey,
                      ))
                ],
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: programValue == null || lessonValue == null
                ? const Center(child: CircularProgressIndicator())
                : Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "Hello, Priya!",
                          style: TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                 Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "What do you wanna learn today?",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SingleChildScrollView(
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 30,
                          ),
                          SizedBox(
                            width: 150,
                            height: 50,
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.book,
                                color: Colors.blue,
                              ),
                              label: const Text(
                                "Programs",
                                style: TextStyle(color: Colors.blue),
                              ),
                              style: const ButtonStyle(
                                side: MaterialStatePropertyAll(
                                    BorderSide(color: Colors.blue, width: 1)),
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 14,
                            height: 50,
                          ),
                          SizedBox(
                            height: 50,
                            width: 150,
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.help,
                                color: Colors.blue,
                              ),
                              label: const Text(
                                "Get help",
                                style: TextStyle(color: Colors.blue),
                              ),
                              style: const ButtonStyle(
                                side: MaterialStatePropertyAll(
                                    BorderSide(color: Colors.blue, width: 1)),
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SingleChildScrollView(
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 30,
                          ),
                          SizedBox(
                            width: 150,
                            height: 50,
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.menu_book,
                                color: Colors.blue,
                              ),
                              label: const Text(
                                "Learn",
                                style: TextStyle(color: Colors.blue),
                              ),
                              style: const ButtonStyle(
                                side: MaterialStatePropertyAll(
                                    BorderSide(color: Colors.blue, width: 1)),
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          SizedBox(
                            width: 150,
                            height: 50,
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.view_kanban_rounded,
                                color: Colors.blue,
                              ),
                              label: const Text(
                                "DD Tracker",
                                style: TextStyle(color: Colors.blue),
                              ),
                              style: const ButtonStyle(
                                side: MaterialStatePropertyAll(
                                    BorderSide(color: Colors.blue, width: 1)),
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Programs for you",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 110,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              "View all",
                              style: TextStyle(color: Colors.grey),
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_right_alt,
                              color: Colors.grey,
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: List.generate(programValue!.items.length,
                              (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: FillImageCard(
                            imageProvider:
                                const AssetImage('Assets/images/firstImage.jpg'),
                            width: 260,
                            heightImage: 190,
                            footer: Text(
                                "Lessons : ${programValue!.items[index].lesson}"),
                            title: Text(
                              programValue!.items[index].category,
                              style: const TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            description: SizedBox(
                                height: 70,
                                child: Text(
                                  programValue!.items[index].name,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )),
                            tagRunSpacing: 30,
                            tagSpacing: 50,
                          ),
                        );
                        // SizedBox(
                        // width: 15,
                        // ),
                        // FillImageCard(
                        // imageProvider:
                        // AssetImage('Assets/images/secondImage.jpg'),
                        // width: 260,
                        // heightImage: 190,
                        // footer: Text("12 lessons"),
                        // title: Text(
                        // "LIFESTYLE",
                        // style: TextStyle(
                        // color: Colors.blue,
                        // fontWeight: FontWeight.bold),
                        // ),
                        // description: SizedBox(
                        // height: 70,
                        // child: Text(
                        // "Understanding your child's\nbehaviour",
                        // style: TextStyle(
                        // fontSize: 16,
                        // fontWeight: FontWeight.bold),
                        // )),
                        // tagRunSpacing: 30,
                        // tagSpacing: 50,
                        // ),
                      })),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Events and experiances",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 55,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              "View all",
                              style: TextStyle(color: Colors.grey),
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_right_alt,
                              color: Colors.grey,
                            )),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          FillImageCard(
                            imageProvider: const AssetImage(
                                'Assets/images/thirdImage.jpg'),
                            width: 260,
                            heightImage: 180,
                            footer: SingleChildScrollView(
                              child: Row(
                                children: [
                                  const Text(
                                    "13 Feb, Sunday",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  const SizedBox(
                                    width: 79,
                                  ),
                                  Container(
                                      height: 34,
                                      width: 70,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.blue),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(25))),
                                      child: TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                            "Book",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.blue),
                                          )))
                                ],
                              ),
                            ),
                            title: const Text(
                              "BABYCARE",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            description: const SizedBox(
                                height: 70,
                                child: Text(
                                  "Understanding of human\nbehaviour",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          FillImageCard(
                            imageProvider: const AssetImage(
                                'Assets/images/thirdImage.jpg'),
                            width: 260,
                            heightImage: 180,
                            footer: SingleChildScrollView(
                              child: Row(
                                children: [
                                  const Text(
                                    "13 Feb, Sunday",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  const SizedBox(
                                    width: 79,
                                  ),
                                  Container(
                                      height: 34,
                                      width: 70,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.blue),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(25))),
                                      child: TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                            "Book",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.blue),
                                          )))
                                ],
                              ),
                            ),
                            title: const Text(
                              "BABYCARE",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            description: const SizedBox(
                                height: 70,
                                child: Text(
                                  "Understanding of human\nbehaviour",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Lessons for you",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 125,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              "View all",
                              style: TextStyle(color: Colors.grey),
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_right_alt,
                              color: Colors.grey,
                            )),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children:
                              List.generate(lessonValue!.items.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: FillImageCard(
                            imageProvider:
                                const AssetImage('Assets/images/thirdImage.jpg'),
                            width: 260,
                            heightImage: 180,
                            footer: SingleChildScrollView(
                              child: Row(
                                children: [
                                   Text(
                                    "${lessonValue!.items[index].duration} min",
                                    style:const  TextStyle(color: Colors.grey),
                                  ),
                                  const SizedBox(
                                    width: 70,
                                  ),
                                  SizedBox(
                                      height: 24,
                                      width: 70,
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.lock_outline_rounded,
                                            color: Colors.grey,
                                          )))
                                ],
                              ),
                            ),
                            title:  Text(
                              lessonValue!.items[index].category,
                              style:const  TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            description:  SizedBox(
                                height: 70,
                                child: Text(
                                    lessonValue!.items[index].name,
                                  style: const TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold),
                                )),
                          ),
                        );
                      })),
                    ),
                  ]),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Icon(Icons.menu_book),
                  label: "Learn",
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Icon(Icons.apps_rounded),
                  label: "Hub",
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Icon(Icons.chat_bubble_outline_rounded),
                  label: "Chat",
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: CircleAvatar(
                    backgroundImage:
                        AssetImage('Assets/images/secondImage.jpg'),
                    radius: 13,
                  ),
                  label: "Profile",
                  backgroundColor: Colors.white),
            ]),
      );
    });
  }
}
