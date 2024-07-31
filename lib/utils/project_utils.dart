class ProjectUtils {
  final String image;
  final String title;
  final String subtitle;
  final String? androidLink;
  final String? iosLink;
  final String? webLink;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    this.androidLink,
    this.iosLink,
    this.webLink,
  });
}


// ###############
// WORK PROJECTS

List<ProjectUtils> workProjectUtils = [
  ProjectUtils(
    image: 'assets/projects/webtv.png',
    title: 'Web TV to watch live sports',
    subtitle:
        'Web Tv is a web application where we can watch live video regarding sports.There are about 25+ channels available to watch live at any time.',
webLink: 'https://webtv4u.vercel.app/'
  ),
  ProjectUtils(
    image: 'assets/projects/amazon.png',
    title: 'Amazon clone with Flutter and NodeJS ',
    subtitle:
        'This is an application built with Flutter and NodeJS, which is an Amazon clone with all the features.',
webLink: 'https://github.com/Tapendra-Bista/amazon?tab=readme-ov-file'
  ),
    ProjectUtils(
    image: 'assets/projects/calculator.png',
    title: 'Calculator',
    subtitle:
        'Calculator app to calculate emi,simple,compound and deposit',
webLink: 'https://github.com/Tapendra-Bista/Interest-calculator?tab=readme-ov-file'
  ),
      ProjectUtils(
    image: 'assets/projects/translation.png',
    title: 'Language Translator',
    subtitle:
        'This translation app freely provide a language translation function.',
webLink: 'https://github.com/Tapendra-Bista/Translation'
  ),
        ProjectUtils(
    image: 'assets/projects/shopeking.png',
    title: 'Shopking',
    subtitle:
        'This is an online shopping app where I work as a moderator for the user interface on a freelance project.',
webLink: 'https://github.com/Tapendra-Bista/Shopeking'
  ),
];
