configure :production, :development do 
  db = URI.parse(ENV["DATABASE_URL"] || "postgres://localhost/kai")

  ActiveRecord::Base.establish_connection(
    :adapter => db.scheme == "postgres" ? "postgresql" : db.scheme,
    :host => db.host,
    :username => db.user,
    :password => db.password,
    :databse => db.path[-1..1],
    :encoding => "utf-8"
    )

end