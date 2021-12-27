#encoding: utf-8

# Before do
#     delete_database backend_url('audiobooks')
# end
  
After do |scenario|
    save_page if scenario.failed?
    # delete_database backend_url('audiobooks')
end

# After do |scenario|
#     save_page if scenario.failed?
# end
