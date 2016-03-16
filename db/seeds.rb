10.times do |n|
  @user = User.first
  @group = FactoryGirl.create(:group, user: @user)
  5.times do |n|
    @member = FactoryGirl.create(:member, group: @group)
    @assignment = FactoryGirl.create(:assignment, group: @group, user: @user)
  end
end
