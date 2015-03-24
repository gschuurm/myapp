require 'spec_helper'

describe Album do
  it {should have_many(:photos)}
end
