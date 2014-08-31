require 'spec_helper'

describe Group do

	let(:user) { FactoryGirl.create(:user) }
	before do
		@group = Group.new(name: "presenters", description: "Group of presenters")
	end

	subject { @group }

	it { should respond_to(:name) }
	it { should respond_to(:description) }
	it { should respond_to(:users) }

	it { should be_valid }

	describe "when name is not present" do
		before { @group.name = ' ' }
		it { should_not be_valid }
	end

end
