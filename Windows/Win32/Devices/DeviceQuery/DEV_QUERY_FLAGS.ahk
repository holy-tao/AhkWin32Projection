#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceQuery
 */
class DEV_QUERY_FLAGS extends Win32Enum {

    /**
     * Native name: DevQueryFlagNone
     * @type {Integer (Int32)}
     */
    static FlagNone => 0

    /**
     * Native name: DevQueryFlagUpdateResults
     * @type {Integer (Int32)}
     */
    static FlagUpdateResults => 1

    /**
     * Native name: DevQueryFlagAllProperties
     * @type {Integer (Int32)}
     */
    static FlagAllProperties => 2

    /**
     * Native name: DevQueryFlagLocalize
     * @type {Integer (Int32)}
     */
    static FlagLocalize => 4

    /**
     * Native name: DevQueryFlagAsyncClose
     * @type {Integer (Int32)}
     */
    static FlagAsyncClose => 8
}
