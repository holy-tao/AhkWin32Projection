#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Devices.DeviceQuery
 * @version v4.0.30319
 */
class DEV_QUERY_STATE{

    /**
     * @type {Integer (Int32)}
     */
    static DevQueryStateInitialized => 0

    /**
     * @type {Integer (Int32)}
     */
    static DevQueryStateEnumCompleted => 1

    /**
     * @type {Integer (Int32)}
     */
    static DevQueryStateAborted => 2

    /**
     * @type {Integer (Int32)}
     */
    static DevQueryStateClosed => 3
}
