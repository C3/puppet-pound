require 'spec_helper'

describe 'pound', :type => :class do

  it { should contain_class('pound::install') }
  it { should contain_class('pound::config')  }
  it { should contain_class('pound::service') }

end
