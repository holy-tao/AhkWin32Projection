#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceQuery
 * @version v4.0.30319
 */
class DEV_QUERY_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DevQueryFlagNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static DevQueryFlagUpdateResults => 1

    /**
     * @type {Integer (Int32)}
     */
    static DevQueryFlagAllProperties => 2

    /**
     * @type {Integer (Int32)}
     */
    static DevQueryFlagLocalize => 4

    /**
     * @type {Integer (Int32)}
     */
    static DevQueryFlagAsyncClose => 8
}
