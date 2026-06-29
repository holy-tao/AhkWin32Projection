#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the accuracy of the magnetometer.
 * @remarks
 * Apps that need calibration may periodically ask the user to calibrate the device. We suggest doing this no more than once every 10 minutes.
 * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/ne-sensorsapi-magnetometeraccuracy
 * @namespace Windows.Win32.Devices.Sensors
 */
export default struct MagnetometerAccuracy {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static MAGNETOMETER_ACCURACY_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static MAGNETOMETER_ACCURACY_UNRELIABLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static MAGNETOMETER_ACCURACY_APPROXIMATE => 2

    /**
     * @type {Integer (Int32)}
     */
    static MAGNETOMETER_ACCURACY_HIGH => 3
}
