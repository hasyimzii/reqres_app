class Job {
    Job({
        required this.name,
        required this.job,
    });

    final String name;
    final String job;

    factory Job.fromJson(Map<String, dynamic> json) => Job(
        name: json["name"],
        job: json["job"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "job": job,
    };
}
