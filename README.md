# opsworks-layer-json-attributes-cookbook

Amazon Web Services Opsworks platform provides a convenient way to deploy custom servers and applications via Chef recipes. Oddly thought, custom JSON (which is passed along to chef-solo) is only able to be configured at the *stack* level (which encompasses entire environments) rather than the *layer* level (which encompasses similar groups of servers within an environment, such as database or application servers.)

This cookbook solves this problem by allowing you to define per-layer custom JSON within the stack's custom JSON. All you need to do is define the JSON you expect a layer to receive underneath within the stack's custom JSON as follows:

    {
      "opsworks-layer-json-attributes": {
        "my-layer-short-name": {
          "my-custom-attribute": "my-custom-value",
        },
      },
    }

and include `"opsworks-layer-json-attributes::default"` as the first element in each of the custom recipe lists in your layer (setup, deploy, etc.)

## Supported Platforms

All platforms. Intended for use on Amazon Web Services Opsworks.

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><tt>['opsworks-layer-json-attributes'][Your layer's short name]</tt></td>
    <td>Hash</td>
    <td>set of attributes to be mixed in to the node's attributes</td>
  </tr>
</table>

## Usage

### opsworks-layer-json-attributes::default

Include `opsworks-layer-json-attributes` in your node's `run_list`:

    {
      "run_list": [
        "recipe[opsworks-layer-json-attributes::default]"
      ]
    }

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (i.e. `add-new-recipe`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

## License and Authors

Author: James (<jtc33@gmail.com>)

Licensed under the MIT license:

Copyright (c) 2014 James Coleman

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

