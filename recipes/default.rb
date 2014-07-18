if node[:opsworks] && node['opsworks-layer-json-attributes']
  node[:opsworks][:instance][:layers].each do |layer_shortname|
    layer_json = node['opsworks-layer-json-attributes'][layer_shortname]
    if layer_json
      deep_update_node_attributes(node.force_default, layer_json)
    end
  end
end
