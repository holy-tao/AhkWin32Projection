#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-parameter-usage-types
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class WPD_PARAMETER_USAGE_TYPES extends Win32Enum{

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
