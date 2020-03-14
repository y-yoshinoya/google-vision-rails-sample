class CrudController < Crud::ApplicationController
  protected

  def stored_params_keys
    super + stored_params_keys_for_search + [:op, :v]
  end

  def default_search_operators
    {}
  end

  def default_search_values
    {}
  end

  def search_operators
    super.reverse_merge(default_search_operators)
  end

  def search_values
    default = default_search_values&.reject do |k, _v|
      search_operators.select {|_k, v| v.blank? }.keys.include?(k.to_s)
    end
    super.reverse_merge(default || {})
  end
end
