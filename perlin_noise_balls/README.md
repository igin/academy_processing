# Perlin Noise Balls
When looking at the random balls example you see that the
balls jump from one random position to another completely
random position. That leads to an annoying flickering.
If we want to have positions that are random but don't
jump as much we can use perlin noise.

Perlin noise is a random function that for the same
input allways returns the same output. So for example

```
float x = noise(42);
```

This `x` will always have the value `0.53270876` no matter how
often we call this function. This is different from the `random` function.
Calling `random` returns a different number every time you call it.

Now the other cool feature of the `noise` function is that 
if your input changes by a small amount the random number also only
changes by a small amount. 

So `noise(42)` is `0.53270876` and `noise(42.001)` is `0.5945343`. 
This can be used to fix our problem of jumping around to much.
We can use the `frameCount` multiplied with a speed factor as input to 
the noise function. Therefore our ball will jump around in only small steps
leading to less flickering.

Perlin noise can be used to do a lot of cool things. It is manly used to
generate continous random things like lines or landscapes. We will see more
examples of this soon.