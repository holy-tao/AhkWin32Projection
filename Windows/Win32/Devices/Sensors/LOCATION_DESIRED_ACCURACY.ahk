#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The LOCATION_DESIRED_ACCURACY enumeration type defines values for the SENSOR_PROPERTY_LOCATION_DESIRED_ACCURACY property.
 * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/ne-sensorsapi-location_desired_accuracy
 * @namespace Windows.Win32.Devices.Sensors
 */
export default struct LOCATION_DESIRED_ACCURACY {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates that the sensor should use the accuracy for which it can optimize power and other such cost considerations.
     * @type {Integer (Int32)}
     */
    static LOCATION_DESIRED_ACCURACY_DEFAULT => 0

    /**
     * Indicates that the sensor should deliver the highest-accuracy report possible. This includes using services that might charge money, or consuming higher levels of battery power or connection bandwidth.
     * @type {Integer (Int32)}
     */
    static LOCATION_DESIRED_ACCURACY_HIGH => 1
}
