require 'spec_helper'

describe "pi_settings/new" do
  before(:each) do
    assign(:pi_setting, stub_model(PiSetting,
      :display => false,
      :capture => false,
      :album => 1
    ).as_new_record)
  end

  it "renders new pi_setting form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", pi_settings_path, "post" do
      assert_select "input#pi_setting_display[name=?]", "pi_setting[display]"
      assert_select "input#pi_setting_capture[name=?]", "pi_setting[capture]"
      assert_select "input#pi_setting_album[name=?]", "pi_setting[album]"
    end
  end
end
