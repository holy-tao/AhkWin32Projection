#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WPD\_PARAMETER\_USAGE\_TYPES enumeration type describes how a method parameter is used in a given method.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-parameter-usage-types
 * @namespace Windows.Win32.Devices.PortableDevices
 */
class WPD_PARAMETER_USAGE_TYPES extends Win32Enum {

    /**
     * Native name: WPD_PARAMETER_USAGE_RETURN
     * @type {Integer (Int32)}
     */
    static RETURN => 0

    /**
     * Native name: WPD_PARAMETER_USAGE_IN
     * @type {Integer (Int32)}
     */
    static IN => 1

    /**
     * Native name: WPD_PARAMETER_USAGE_OUT
     * @type {Integer (Int32)}
     */
    static OUT => 2

    /**
     * Native name: WPD_PARAMETER_USAGE_INOUT
     * @type {Integer (Int32)}
     */
    static INOUT => 3
}
