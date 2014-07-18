def deep_update_node_attributes(node, attributes)
  attributes.each do |(key, value)|
    case value
    when Hash
      deep_update_node_attributes(node[key], value)
    else
      node[key] = value
    end
  end
end
