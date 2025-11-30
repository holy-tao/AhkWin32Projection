#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-bitrate-types
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class WPD_BITRATE_TYPES extends Win32Enum{

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
