require 'spec_helper'

describe 'pound::service', :type => :class do

  it { should contain_service('pound') }

end
