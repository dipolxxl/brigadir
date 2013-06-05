require 'spec_helper'

describe "brigades/show" do
  before(:each) do
    @brigade = assign(:brigade, stub_model(Brigade,
      :name => "Name",
      :workers => 1,
      :cost => 5,
      :country => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/5/)
    rendered.should match(//)
  end
end
