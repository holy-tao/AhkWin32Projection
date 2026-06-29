#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Sensors
 */
export default struct AXIS {
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
    static AXIS_X => 0

    /**
     * @type {Integer (Int32)}
     */
    static AXIS_Y => 1

    /**
     * @type {Integer (Int32)}
     */
    static AXIS_Z => 2

    /**
     * @type {Integer (Int32)}
     */
    static AXIS_MAX => 3
}
