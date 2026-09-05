#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class BUS_QUERY_ID_TYPE extends Win32Enum {

    /**
     * Native name: BusQueryDeviceID
     * @type {Integer (Int32)}
     */
    static DeviceID => 0

    /**
     * Native name: BusQueryHardwareIDs
     * @type {Integer (Int32)}
     */
    static HardwareIDs => 1

    /**
     * Native name: BusQueryCompatibleIDs
     * @type {Integer (Int32)}
     */
    static CompatibleIDs => 2

    /**
     * Native name: BusQueryInstanceID
     * @type {Integer (Int32)}
     */
    static InstanceID => 3

    /**
     * Native name: BusQueryDeviceSerialNumber
     * @type {Integer (Int32)}
     */
    static DeviceSerialNumber => 4

    /**
     * Native name: BusQueryContainerID
     * @type {Integer (Int32)}
     */
    static ContainerID => 5
}
