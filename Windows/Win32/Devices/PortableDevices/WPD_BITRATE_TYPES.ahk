#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WPD\_BITRATE\_TYPES enumeration type describes an audio files compression type.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-bitrate-types
 * @namespace Windows.Win32.Devices.PortableDevices
 */
export default struct WPD_BITRATE_TYPES {
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
    static WPD_BITRATE_TYPE_UNUSED => 0

    /**
     * @type {Integer (Int32)}
     */
    static WPD_BITRATE_TYPE_DISCRETE => 1

    /**
     * @type {Integer (Int32)}
     */
    static WPD_BITRATE_TYPE_VARIABLE => 2

    /**
     * @type {Integer (Int32)}
     */
    static WPD_BITRATE_TYPE_FREE => 3
}
