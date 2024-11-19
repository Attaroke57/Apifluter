class PostModel {
  final String strBadge;
  final String strLeague;
  final String strTeam;
  final String strDescriptionEN;

  PostModel({ 
    required this.strBadge, 
    required this.strLeague, 
    required this.strTeam, 
    required this.strDescriptionEN
  });

 
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      strBadge: json['strBadge'],
      strLeague: json['strLeague'],
      strTeam: json['strTeam'],
      strDescriptionEN: json['strDescriptionEN']
    );
  }
}
