require 'spec_helper'

describe "brigades/new" do
  before(:each) do
    assign(:brigade, stub_model(Brigade,
      :name => "MyString",
      :workers => 1,
      :cost => 1.5,
      :country => nil
    ).as_new_record)
  end

  it "renders new brigade form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", brigades_path, "post" do
      assert_select "input#brigade_name[name=?]", "brigade[name]"
      assert_select "input#brigade_workers[name=?]", "brigade[workers]"
      assert_select "input#brigade_cost[name=?]", "brigade[cost]"
      assert_select "input#brigade_country[name=?]", "brigade[country]"
    end
  end
end
