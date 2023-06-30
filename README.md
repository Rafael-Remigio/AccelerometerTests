# AccelerometerTests


Using the [sensor_plus package](https://pub.dev/packages/sensors_plus) (permissive software license BSD-3-Clause License)

<img src="demo.gif">



## How to deal with the oscilation of the signal

Possible solutions:

* Get the average of latest x values
* Fourier transform the signal. From all the decomposed frequencies capture the one with the biggest amplitude. Use its non-zero center amplitude as the average (this is probably not a very smart idea)
