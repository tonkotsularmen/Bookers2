class ConfigCreatorsController < ApplicationController

  def download
    download_file_name = "public/master/harahetta.JPG"
    send_file download_file_name
  end

end
