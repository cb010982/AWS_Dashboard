class User {
  final String email;
  final String password;
  final String dashboardUrl;
  final String localRoute;

  User({required this.email, required this.password, this.dashboardUrl = '', this.localRoute = ''});
}

final users = [
  User(email: 'senuji@acumenintelligence.com', password: 'Senu@123', dashboardUrl: 'https://test.acumenintelligence.tech/aws/'),
  User(email: 'senith@acumenintelligence.com', password: 'Senu@123', dashboardUrl: 'https://vstdashboard.acumenintelligence.tech/'),
  User(email: 'swetha@acumenintelligence.com', password: 'Senu@123', localRoute: 'custom_page'), // New user entry
];

