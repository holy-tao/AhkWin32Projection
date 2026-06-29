#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WPD\_STREAM\_UNITS enumeration specifies the unit types to be used for IPortableDeviceUnitsStream operations.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-stream-units
 * @namespace Windows.Win32.Devices.PortableDevices
 */
export default struct WPD_STREAM_UNITS {
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
    static WPD_STREAM_UNITS_BYTES => 0

    /**
     * @type {Integer (Int32)}
     */
    static WPD_STREAM_UNITS_FRAMES => 1

    /**
     * @type {Integer (Int32)}
     */
    static WPD_STREAM_UNITS_ROWS => 2

    /**
     * @type {Integer (Int32)}
     */
    static WPD_STREAM_UNITS_MILLISECONDS => 4

    /**
     * @type {Integer (Int32)}
     */
    static WPD_STREAM_UNITS_MICROSECONDS => 8
}
