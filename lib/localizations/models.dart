class Language{
  final int id;
  final String name;
  final String flag;
  final String lanuagecode;

  Language(this.id, this.name, this.flag, this.lanuagecode);

  static List<Language>LanguageList(){
    return <Language>[
      Language(1, 'English', 'US', 'en'),
      Language(1, 'Arabic', 'EG', 'ar'),
    ];
}
}