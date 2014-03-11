require 'spec_helper'

describe 'pound::install', :type => :class do

  it { should contain_package('pound')  }

end
