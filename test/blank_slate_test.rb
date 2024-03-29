require 'test_helper'

include BlankSlate

module BlankSlate
  class Parent
    def inherited
      "this should be inherited"
    end
  end

  class TesterClass < Parent
    def one
      "one"
    end
  end
end

describe "BlankSlate" do
  def blank_slate(&block)
    BlankSlate(BlankSlate::TesterClass, &block)
  end

  it "returns a class with all instance_methods of the given class" do
    assert_equal BlankSlate::TesterClass.instance_methods.sort, blank_slate.instance_methods.sort
  end

  it "sets the values of instance methods to nil" do
    null_object = blank_slate.new

    _(null_object.one).must_be_nil
  end

  it "accepts a block to define methods on the null class" do
    null_object = blank_slate do
      def passed_block_method
        'this is from the method defined in the block!'
      end
    end.new

    _(null_object.passed_block_method).must_equal 'this is from the method defined in the block!'
  end

  it "allows the block to override method definitions from the given class" do
    null_object = blank_slate do
      def one
        'not the same one'
      end
    end.new

    _(null_object.one).must_equal 'not the same one'
  end

  it "inherits from the provide class" do
    null_object = blank_slate.new
    assert_kind_of BlankSlate::TesterClass, null_object
    assert_respond_to null_object, :inherited
  end

  it "preserves parent methods" do
    null_object = blank_slate.new
    assert_equal null_object.inherited, 'this should be inherited'
  end

  it "uses the specified default_value for the return" do
    null_object = BlankSlate(BlankSlate::TesterClass, default_value: "blank").new
    assert_equal "blank", null_object.one
  end
end
