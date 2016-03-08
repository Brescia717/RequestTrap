class ExtractRawRequest

  def initialize(request_obj)
    @request_obj = request_obj
    @raw_request = {}
  end

  def extract
    raw_request.merge!( hashify(request_obj) )
    return raw_request
  end

  private

  attr_reader :request_obj, :raw_request

  def passable?(value)
    passable_values = [String,Symbol,nil,Fixnum]
    passable_values.include?(value.class) ? true : false
  end

  def has_instance_variables?(object)
    object.instance_variables.count > 0 ? true : false
  end

  def count_instance_vars(object)
    object.instance_variables.count
  end

  def hashify(object, output={})
    if count_instance_vars(object) > 0
      i = 0
      while i < count_instance_vars(object)
        key   = object.instance_variables[i].to_s.gsub(/[!@]/, "").to_sym
        value = object.send key
        if value.is_a? Array
          value.each_with_index { |v, index| value[index] = v.to_s }
        elsif value.is_a? Hash
          value.each { |k, v| (value[k] = v.to_s) if !v.is_a?(Hash) }
        elsif passable?(value)
          value = value.to_s
        end
        output.merge!({ key => value })
        i += 1
      end
    end
    output
  end

end
