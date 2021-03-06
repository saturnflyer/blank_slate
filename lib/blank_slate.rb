module BlankSlate
  def BlankSlate(klass, &block)
    blank_slate = Class.new(klass, &block)
    blank_slate.class_eval do
      klass.instance_methods(false).
      reject{|meth| instance_methods(false).include?(meth) }.
      each do |meth|
        define_method(meth){ nil }
      end
    end
    blank_slate
  end
end
