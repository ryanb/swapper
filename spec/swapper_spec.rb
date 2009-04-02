require File.dirname(__FILE__) + '/spec_helper'

describe Swapper do
  it "should swap to characters at cursor point if packed string" do
    Swapper.new("abcd", 1).swap.should == "bacd"
  end
  
  it "should swap on extreme ends" do
    Swapper.new("abcd", 0).swap.should == "bacd"
    Swapper.new("abcd", 4).swap.should == "abdc"
    Swapper.new("abcd", 20).swap.should == "abdc"
  end
  
  it "should swap on space if there is one" do
    Swapper.new("ab cd", 1).swap.should == "cd ab"
  end
  
  it "should swap only element cursor is on" do
    Swapper.new("ab cd ef", 1).swap.should == "cd ab ef"
  end
  
  it "should swap with earlier element if cursor is in middle element" do
    Swapper.new("ab cd ef", 4).swap.should == "cd ab ef"
  end
  
  it "should consider cursor at end if beyond last element" do
    Swapper.new("ab cd ef", 23).swap.should == "ab ef cd"
  end
  
  it "should swap on comma-space taking presedence over normal space" do
    Swapper.new("ab, cd ef", 1).swap.should == "cd ef, ab"
  end
  
  it "should swap within parenthesis" do
    Swapper.new("foo('testing', 123)", 5).swap.should == "foo(123, 'testing')"
  end
end
