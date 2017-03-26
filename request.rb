require "net/http"

base_url = "http://localhost:3000"
end_point = "/api/people"
# Get All
uri = URI(base_url + end_point)
res = Net::HTTP.get_response(uri)
puts res.body

# Post
res = Net::HTTP.post_form(uri, "name" => "Peter", "gender" => "Male", "age" => "18")
puts res.body

# uri = URI(base_url)
# http = Net::HTTP.new(uri.host, uri.port)

# Get First Task
# res = http.get(end_point + "/1")
# puts res.body

# Patch (Update First Task)
# req = Net::HTTP::Patch.new(end_point + "/1")
# req.set_form_data({ "name" => "New Name", "color_code" => "green" })
# res = http.request(req)
# puts res.body

# Delete
# res = http.delete("/api/v2/tasks/1")
# puts res.body

