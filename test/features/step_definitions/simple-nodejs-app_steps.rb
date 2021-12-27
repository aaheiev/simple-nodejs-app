Given("application started") do
    visit app_url '/'
end

When("I visit the {string} url") do |string|
    visit app_url string
end

Then("I see application's home page") do
    expect(page).to have_content("XLinQ © 2020 - Simple NodeJs App")
    # expect(page).to have_content("Assembly Version: #{$assembly_version}.")
    # TODO: enable test for assembly version
end

Then("I see application's uptime") do
    expect(page).to have_content("uptime")
end

Then("I see application product and assembly versions") do
    resp = last_json
    expect(resp).to have_json_path("product_version")
    expect(resp).to have_json_path("assembly_version")
    # TODO: check versions match app versions
end
  
Then("I see build information") do
    resp = last_json
    expect(resp).to have_json_path("assembly_version")
    expect(resp).to have_json_path("product_version")
    expect(resp).to have_json_path("git_commit_id")
    expect(resp).to have_json_path("git_branch")
end

Then("I see cpu info") do
    resp = last_json
    expect(resp).to have_json_path("cpu")
end

Then("I see memory info") do
    resp = last_json
    expect(resp).to have_json_path("mem")
end

Then("I see calculated results") do
    resp = last_json
    expect(resp).to have_json_path("rand_value")
    expect(resp).to have_json_path("started_at")
    expect(resp).to have_json_path("fineshed_at")
end

Then("I see {int} error page with common html theme") do |error_code|
    expect(page.status_code).to be == error_code
    expect(page).to have_content("XLinQ © 2020 - Simple NodeJs App")
end

Then("I see {int} error") do |error_code|
    expect(page.status_code).to be == error_code
end
