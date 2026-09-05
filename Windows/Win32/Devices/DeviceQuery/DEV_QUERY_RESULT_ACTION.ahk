#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceQuery
 */
class DEV_QUERY_RESULT_ACTION extends Win32Enum {

    /**
     * Native name: DevQueryResultStateChange
     * @type {Integer (Int32)}
     */
    static StateChange => 0

    /**
     * Native name: DevQueryResultAdd
     * @type {Integer (Int32)}
     */
    static Add => 1

    /**
     * Native name: DevQueryResultUpdate
     * @type {Integer (Int32)}
     */
    static Update => 2

    /**
     * Native name: DevQueryResultRemove
     * @type {Integer (Int32)}
     */
    static Remove => 3
}
