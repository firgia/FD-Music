part of dashboard;

class DashboardController extends GetxController {
  final pageSelected = SidebarPage.home.obs;

  final listTopMusic = [
    DashboardMusic(
      image: AssetImage(ImageRasterConstant.leaveTheDoorOpen),
      title: "Leave The Door Open",
      singerName: "Bruno Mars, Anderson .Paak, Silk Sonic",
      duration: Duration(seconds: 241),
    ),
    DashboardMusic(
      image: AssetImage(ImageRasterConstant.atMyWorst),
      title: "At My Worst ",
      singerName: "Pink Sweat\$",
      duration: Duration(seconds: 125),
    ),
    DashboardMusic(
      image: AssetImage(ImageRasterConstant.levitating),
      title: "Levitating ",
      singerName: "Dua Lipa",
      duration: Duration(seconds: 221),
    ),
    DashboardMusic(
      image: AssetImage(ImageRasterConstant.peaches),
      title: "Peaches ",
      singerName: "Justin Bieber ft. Daniel Caesar, Giveon",
      duration: Duration(seconds: 223),
    ),
    DashboardMusic(
      image: AssetImage(ImageRasterConstant.saveYourTears),
      title: "Save Your Tears ",
      singerName: "The Weeknd & Ariana Grande",
      duration: Duration(seconds: 206),
    ),
  ];

  final listRecommendedAlbum = [
    DashboardAlbum(
        image: AssetImage(ImageRasterConstant.album1), name: "Light"),
    DashboardAlbum(
        image: AssetImage(ImageRasterConstant.album2), name: "Different World"),
    DashboardAlbum(
        image: AssetImage(ImageRasterConstant.album3), name: "Relaxing"),
  ];

  final listPopularMusic = [
    DashboardMusic(
      image: AssetImage(ImageRasterConstant.maroon5),
      title: "Memories",
      singerName: "Maroon 5",
      duration: Duration(seconds: 221),
    ),
    DashboardMusic(
      image: AssetImage(ImageRasterConstant.spiderman),
      title: "Sunflower (Spider-Man: Into the Spider-Verse)",
      singerName: "Post Malone, Swae Lee ",
      duration: Duration(seconds: 162),
    ),
    DashboardMusic(
      image: AssetImage(ImageRasterConstant.yayanJatnika),
      title: "Lamunan",
      singerName: "Yayan Jatnika",
      duration: Duration(seconds: 243),
    ),
  ];

  final profil = DashboardProfile(
      image: AssetImage(ImageRasterConstant.logo),
      name: "Gia Developer",
      email: "giagamedeveloper@gmail.com");
}
