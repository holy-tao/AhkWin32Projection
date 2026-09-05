#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
class INF_STYLE extends Win32BitflagEnum {

    /**
     * Native name: INF_STYLE_NONE
     * @type {Integer (UInt32)}
     */
    static NONE => 0

    /**
     * Native name: INF_STYLE_OLDNT
     * @type {Integer (UInt32)}
     */
    static OLDNT => 1

    /**
     * Native name: INF_STYLE_WIN4
     * @type {Integer (UInt32)}
     */
    static WIN4 => 2

    /**
     * Native name: INF_STYLE_CACHE_ENABLE
     * @type {Integer (UInt32)}
     */
    static CACHE_ENABLE => 16

    /**
     * Native name: INF_STYLE_CACHE_DISABLE
     * @type {Integer (UInt32)}
     */
    static CACHE_DISABLE => 32

    /**
     * Native name: INF_STYLE_CACHE_IGNORE
     * @type {Integer (UInt32)}
     */
    static CACHE_IGNORE => 64
}
