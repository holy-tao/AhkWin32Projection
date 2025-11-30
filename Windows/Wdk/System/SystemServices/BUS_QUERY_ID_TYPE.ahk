#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class BUS_QUERY_ID_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static BusQueryDeviceID => 0

    /**
     * @type {Integer (Int32)}
     */
    static BusQueryHardwareIDs => 1

    /**
     * @type {Integer (Int32)}
     */
    static BusQueryCompatibleIDs => 2

    /**
     * @type {Integer (Int32)}
     */
    static BusQueryInstanceID => 3

    /**
     * @type {Integer (Int32)}
     */
    static BusQueryDeviceSerialNumber => 4

    /**
     * @type {Integer (Int32)}
     */
    static BusQueryContainerID => 5
}
