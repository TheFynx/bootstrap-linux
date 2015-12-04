# bootstrap-linux-cookbook

TODO: Enter the cookbook description here.

## Supported Platforms

TODO: List your supported platforms.

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['bootstrap-linux']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### bootstrap-linux::default

Include `bootstrap-linux` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[bootstrap-linux::default]"
  ]
}
```

## License and Authors

Author:: Levi Smith (<levi@fynx.me>)
