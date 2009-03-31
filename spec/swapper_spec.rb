require File.dirname(__FILE__) + '/spec_helper'

describe Swapper do
  it "should swap to characters at cursor point if packed string" do
    Swapper.new("abcd", 1).swap.should == "bacd"
  end
  
  it "should not swap if cursor is at beginning or end of string" do
    [-5, 0, 4, 20].each do |position|
      Swapper.new("abcd", position).swap.should == "abcd"
    end
  end
  
  it "should swap on space if there is one" do
    Swapper.new("ab cd", 1).swap.should == "cd ab"
  end
  
  it "should swap only element cursor is on" do
    Swapper.new("ab cd ef", 1).swap.should == "cd ab ef"
  end
end
