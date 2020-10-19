# Controller Tests

## Purpose

Test the validity of how json is serialized and deserialized by our configuration.

Many of these tests should be architectural in nature - specifically, we should be able to confirm that each resource's endpoints are behaving the same given that they're using the same configuration.

If they are to follow different configuration, they should be grouped into another architeture test.

E.g.
```elixir
defmodule Controllers.Configuration do
  
  
  @configs [:one, :two, :three]
  @controller_query_properties %{:one => "", :two => "", :three =>""}

  def validate_each_controller_config do
    # iterate each config, gathering controllers
    # validate each controller has the correct config applied
  end

  defp validate_controller_configuration(config, controller) do
    # validate the correct configuration is applied, and nothing else
    
  end

  defp get_controller_with_config_expectation(config_type) do
    # use config along with query property to load controllers from http ecosystem
    
  end

end

defmodule TaskManagerWeb.ControllerConfig do
  # controller property-based testing here
end
```

The configuration itself should be tested using a form of property-based tests.

Testing the logic of the business domain information that will be serialized/deserialized by our HTTP boundary should be performed by unit tests.


