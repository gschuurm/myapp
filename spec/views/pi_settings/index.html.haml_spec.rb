require 'spec_helper'

describe "pi_settings/index" do
  before(:each) do
    assign(:pi_settings, [
      stub_model(PiSetting,
        :display => false,
        :capture => false,
        :album => 1
      ),
      stub_model(PiSetting,
        :display => false,
        :capture => false,
        :album => 1
      )
    ])
  end

  it "renders a list of pi_settings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    #assert_select "tr>td", :text => false.to_s, :count => 2
    #assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
