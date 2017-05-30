You can now start deploying software. To find available charts you can use the search command.

For example, to deploy Redis we need to find a Redis chart.

`helm search redis`{{execute}}

We can identify more information with the _inspect_ command.

`helm inspect stable/redis`{{execute}}
