#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceQuery
 */
class DEV_QUERY_STATE extends Win32Enum {

    /**
     * Native name: DevQueryStateInitialized
     * @type {Integer (Int32)}
     */
    static Initialized => 0

    /**
     * Native name: DevQueryStateEnumCompleted
     * @type {Integer (Int32)}
     */
    static EnumCompleted => 1

    /**
     * Native name: DevQueryStateAborted
     * @type {Integer (Int32)}
     */
    static Aborted => 2

    /**
     * Native name: DevQueryStateClosed
     * @type {Integer (Int32)}
     */
    static Closed => 3
}
