module ApplicationHelper
  def how_long_since(time)
    time_ago_in_words(Time.at(time.to_i).to_datetime)
  end


  def user_profile(id)
    "/user/#{id}/?access_token=#{ENV['instagram_token']}"
  end
end
