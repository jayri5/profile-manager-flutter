class ToDo {
  String? name;
  String? email;
  String? source;

  ToDo({
    required this.name,
    required this.email,
    required this.source,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(name: 'rinki', email: 'random', source: 'Instagram'),
      ToDo(name: 'jay', email: 'random', source: 'Facebook'),
      ToDo(name: 'jayri', email: 'random', source: 'Organic'),
    ];
  }
}
