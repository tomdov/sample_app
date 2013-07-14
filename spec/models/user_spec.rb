# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe User do

  before(:each) do
    @attr = {:name=>"ex_user", :email=>"t.t@t.net"}
    @max_len_name = 51
  end

  it "should create a new instance given a valid attr" do
    User.create!(:name => "Example User", :email => "user@example.com")
  end

  it "should require a name" do
    no_name_user = User.new(@attr.merge(:name => ""))
    no_name_user.should_not be_valid
  end

  it "should require a email" do
    User.new(@attr.merge(:email => "")).should_not be_valid
  end

  it "should reject names that are too long" do
    long_name_user = User.new(@attr.merge( :name => ("a" * @max_len_name)))
    long_name_user.should_not be_valid
  end

  it " should accept valid email address" do
    addresses = %w[user@foo.com THIS_IS_FULL_CAPS@GMAIL.COM hey.now@g.net]
    addresses.each do |address|
      valid_email_user = User.new(:name => "exmp_user", :email => address)
      valid_email_user.should be_valid
    end

  end

  it "should not accept invalid email addresses" do
    addresses = %w[us@er@foo.com THIS_IS_FULL_CAPS@GMAIL,COM hey.now@g.]
    addresses.each do |address|
      invalid_email_user = User.new(:name => "exmp_user", :email => address)
      invalid_email_user.should_not be_valid
    end
  end

  it "should reject duplicate email addresses" do
    User.create!(@attr)
    user_with_dup_email = User.new(@attr)
    user_with_dup_email.should_not be_valid
  end

  it " should reject emails identical up to case" do
    mail = "user@expl.com"
    User.create!(@attr.merge(:email => mail))
    user_with_same_email = User.new(@attr.merge(:email => mail.upcase))
    user_with_same_email.should_not be_valid
  end
end
