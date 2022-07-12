module BlankSlate
  def BlankSlate(klass, default_value: nil, &block)
    blank_slate = Class.new(klass, &block)
    blank_slate.class_eval do
      (klass.instance_methods(false) - instance_methods(false)).each do |meth|
        define_method(meth){ default_value }
      end
    end
    blank_slate
  end
end
