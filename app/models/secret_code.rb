class SecretCode < ApplicationRecord
  has_one :user

  def self.generate_bulk_codes total_numbers
    payload = []
    total_numbers.times{
      payload.push({code: SecureRandom.hex(4)})
    }
    self.create(payload)
  end

  def self.is_avail? s_code
    return false if s_code.nil?
    secret_obj = self.includes(:user).find_by(code: s_code)
    if secret_obj.present? && secret_obj.user.nil?
      return true
    else
      return false
    end
  end
end
