class Answer{
  final String answer;

  final String image;

//<editor-fold desc="Data Methods">

  const Answer({
    required this.answer,
    required this.image,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Answer &&
          runtimeType == other.runtimeType &&
          answer == other.answer &&
          image == other.image);

  @override
  int get hashCode => answer.hashCode ^ image.hashCode;

  @override
  String toString() {
    return 'Answer{' + ' answer: $answer,' + ' image: $image,' + '}';
  }

  Answer copyWith({
    String? answer,
    String? image,
  }) {
    return Answer(
      answer: answer ?? this.answer,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'answer': this.answer,
      'image': this.image,
    };
  }

  factory Answer.fromMap(Map<String, dynamic> map) {
    return Answer(
      answer: map['answer'] as String,
      image: map['image'] as String,
    );
  }

//</editor-fold>
}