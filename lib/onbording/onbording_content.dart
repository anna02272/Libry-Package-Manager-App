// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_internship_2024_app/i18n/strings.g.dart';

class OnbordingContent {
  String image;
  String title;
  String discription;

  OnbordingContent({
    required this.image,
    required this.title,
    required this.discription,
  });
}


List<OnbordingContent> contents=[
  OnbordingContent(
    image: 'assets/images/[removal.ai]_66785f13-6589-429b-84ec-f65944e4b9ce-libraries.png', 
    title: t.welcome, 
    discription: t.onborading_description_welcome),
    discription: t.onborading_description_welcome),
  OnbordingContent(
    image: 'assets/images/1713866345900.jpeg', 
    title: t.onborading_title_details, 
    discription: t.onborading_description_details),
     OnbordingContent(
    image: 'assets/images/Removal-670.png', 
    title: t.onborading_title_search, 
    discription:t.onborading_description_search ),
    OnbordingContent(
    image: 'assets/images/[removal.ai]_0036c995-d2df-45fa-96f5-abc4420b9000-favorites.png', 
    title: t.onborading_title_favorites, 
    discription: t.onborading_description_favorites),
    ];