require 'spec_helper'

describe "pi_settings/edit" do
  before(:each) do
    @pi_setting = assign(:pi_setting, stub_model(PiSetting,
      :display => false,
      :capture => false,
      :album => 1
    ))
  end

  it "renders the edit pi_setting form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", pi_setting_path(@pi_setting), "post" do
      assert_select "input#pi_setting_display[name=?]", "pi_setting[display]"
      assert_select "input#pi_setting_capture[name=?]", "pi_setting[capture]"
      assert_select "input#pi_setting_album[name=?]", "pi_setting[album]"
    end
  end
end
