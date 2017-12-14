class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :secret_code
  before_validation :set_secret_code

  ROLES = %w[admin anonymous].freeze

  attr_accessor :secret_code_indeifier

  validates_presence_of :secret_code

  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
    end
  end

  def is?(role)
    roles.include?(role.to_s)
  end

  private

  def set_secret_code
    self.secret_code = SecretCode.find_by(code: self.secret_code_indeifier) if new_record?
  end
end
