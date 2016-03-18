10.times do |n|
  @user = User.first
  @group = FactoryGirl.create(:group, user: @user)
  5.times do |n|
    @member = FactoryGirl.create(:member, group: @group)
    @assignment = FactoryGirl.create(:assignment, group: @group, user: @user)
  end
end

10.times do |n|
	@group = Group.first
	name = "member vn#{n}"
	created_at = Faker::Date.backward(5)
	updated_at = Faker::Date.backward(2)
	@member = @group.members.create(name: name, created_at: created_at, updated_at: updated_at )
end 
