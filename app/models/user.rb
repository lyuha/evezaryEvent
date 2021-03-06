class User < ActiveRecord::Base
  include DailyCount
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :trackable# , :registerable,
#          :recoverable, :rememberable, :trackable, :validatable
  belongs_to :gift
  has_many :access_logs
  geocoded_by :address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates
  
  def random_code
    evezary = %w(e v e z a r y) * 3
    digit = %w(4 6 7 9) * 2
    code = "e" + evezary.shuffle.join[0..4] + "y-" + digit.shuffle.join[0..3]
    code
  end

end
