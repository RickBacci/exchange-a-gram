module ApplicationHelper
  def how_long_since(time)
    time_ago_in_words(Time.at(time.to_i).to_datetime)
  end
end
