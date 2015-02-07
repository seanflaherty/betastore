class Customer < User

  has_many :orders
  has_many :line_items, :through => :orders
  has_many :products, :through => :line_items

  before_validation :downcase_email
  before_validation :upcase_state_code
  validates :name, presence: true
  #          :message => ""
  validates :email, presence:true, uniqueness: true
  validate :valid_state_code


  validates_format_of :email,
                      :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/,
                      :message => "Invalid Email"
  validates_format_of :zip_code,
                      :with => %r{\d{5}(-\d{4})?},
                      :message => "Invalid Zip Code",
                      allow_blank: true


  private

  def downcase_email
    unless self.email.nil?
      self.email = self.email.downcase
    end
  end

  def upcase_state_code
    unless self.state_code.nil?
      self.state_code = self.state_code.upcase
    end
  end

  def valid_state_code
    unless self.state_code.nil?
      if !(['AK','AL','AZ','AR','CA','CO','CT','DE','FL','GA','HI','ID','IL','IN','IA','KS','KY','LA','ME','MD','MA','MI','MN','MS','MO','MT','NE','NV','NH','NJ','NM','NY','NC','ND','OH','OK','OR','PA','RI','SC','SD','TN','TX','UT','VT','VA','WA','WV','WI','WY'].include? self.state_code)
        errors.add(:state_code, "Invalid State")
      end
    end
  end

end

#SCF { 'AK','AL','AZ','AR','CA','CO','CT','DE','FL','GA','HI','ID','IL','IN','IA','KS','KY','LA','ME','MD','MA','MI','MN','MS','MO','MT','NE','NV','NH','NJ','NM','NY','NC','ND','OH','OK','OR','PA','RI','SC','SD','TN','TX','UT','VT','VA','WA','WV','WI', 'WY' }
