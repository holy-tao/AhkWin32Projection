#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Sensors
 */
export default struct SimpleDeviceOrientation {
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
    static SIMPLE_DEVICE_ORIENTATION_NOT_ROTATED => 0

    /**
     * @type {Integer (Int32)}
     */
    static SIMPLE_DEVICE_ORIENTATION_ROTATED_90 => 1

    /**
     * @type {Integer (Int32)}
     */
    static SIMPLE_DEVICE_ORIENTATION_ROTATED_180 => 2

    /**
     * @type {Integer (Int32)}
     */
    static SIMPLE_DEVICE_ORIENTATION_ROTATED_270 => 3

    /**
     * @type {Integer (Int32)}
     */
    static SIMPLE_DEVICE_ORIENTATION_ROTATED_FACE_UP => 4

    /**
     * @type {Integer (Int32)}
     */
    static SIMPLE_DEVICE_ORIENTATION_ROTATED_FACE_DOWN => 5
}
