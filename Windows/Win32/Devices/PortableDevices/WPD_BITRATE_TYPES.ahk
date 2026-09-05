#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WPD\_BITRATE\_TYPES enumeration type describes an audio files compression type.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-bitrate-types
 * @namespace Windows.Win32.Devices.PortableDevices
 */
class WPD_BITRATE_TYPES extends Win32Enum {

    /**
     * Native name: WPD_BITRATE_TYPE_UNUSED
     * @type {Integer (Int32)}
     */
    static TYPE_UNUSED => 0

    /**
     * Native name: WPD_BITRATE_TYPE_DISCRETE
     * @type {Integer (Int32)}
     */
    static TYPE_DISCRETE => 1

    /**
     * Native name: WPD_BITRATE_TYPE_VARIABLE
     * @type {Integer (Int32)}
     */
    static TYPE_VARIABLE => 2

    /**
     * Native name: WPD_BITRATE_TYPE_FREE
     * @type {Integer (Int32)}
     */
    static TYPE_FREE => 3
}
