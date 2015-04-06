require 'spec_helper'

describe "pi_settings/show" do
  before(:each) do
    @pi_setting = assign(:pi_setting, stub_model(PiSetting,
      :display => false,
      :capture => false,
      :album => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/1/)
  end
end
