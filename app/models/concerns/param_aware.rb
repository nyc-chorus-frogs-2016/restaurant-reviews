module ParamAware
	def to_param
    "#{id}-#{name.parameterize}"
  end
end