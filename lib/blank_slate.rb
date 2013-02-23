module BlankSlate
  def BlankSlate(klass, &block)
    blank_slate = Class.new(&block)
    blank_slate.class_eval do
      klass.instance_methods(false).each do |meth|
        define_method(meth){ nil } unless method_defined?(meth)
      end
    end
    blank_slate
  end
end