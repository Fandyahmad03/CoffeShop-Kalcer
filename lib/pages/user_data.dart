class UserData {
  static final Map<String, Map<String, String>> _users = {
    "user1@example.com": {"password": "password1", "name": "John Doe"},
    "user2@example.com": {"password": "password2", "name": "Jane Smith"},
  };

  static bool login(String email, String password) {
    return _users.containsKey(email) && _users[email]!['password'] == password;
  }

  static String getNameByEmail(String email) {
    return _users[email]?['name'] ?? "Unknown";
  }

  static void register(String email, String password, String name) {
    if (!_users.containsKey(email)) {
      _users[email] = {"password": password, "name": name};
    }
  }
}
