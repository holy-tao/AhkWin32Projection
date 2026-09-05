#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The LOCATION_DESIRED_ACCURACY enumeration type defines values for the SENSOR_PROPERTY_LOCATION_DESIRED_ACCURACY property.
 * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/ne-sensorsapi-location_desired_accuracy
 * @namespace Windows.Win32.Devices.Sensors
 */
class LOCATION_DESIRED_ACCURACY extends Win32Enum {

    /**
     * Indicates that the sensor should use the accuracy for which it can optimize power and other such cost considerations.
     * Native name: LOCATION_DESIRED_ACCURACY_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * Indicates that the sensor should deliver the highest-accuracy report possible. This includes using services that might charge money, or consuming higher levels of battery power or connection bandwidth.
     * Native name: LOCATION_DESIRED_ACCURACY_HIGH
     * @type {Integer (Int32)}
     */
    static HIGH => 1
}
