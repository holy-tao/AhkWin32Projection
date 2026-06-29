#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WPD\_PARAMETER\_USAGE\_TYPES enumeration type describes how a method parameter is used in a given method.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-parameter-usage-types
 * @namespace Windows.Win32.Devices.PortableDevices
 */
export default struct WPD_PARAMETER_USAGE_TYPES {
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
    static WPD_PARAMETER_USAGE_RETURN => 0

    /**
     * @type {Integer (Int32)}
     */
    static WPD_PARAMETER_USAGE_IN => 1

    /**
     * @type {Integer (Int32)}
     */
    static WPD_PARAMETER_USAGE_OUT => 2

    /**
     * @type {Integer (Int32)}
     */
    static WPD_PARAMETER_USAGE_INOUT => 3
}
