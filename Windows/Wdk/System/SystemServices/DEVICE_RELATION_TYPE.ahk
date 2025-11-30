#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class DEVICE_RELATION_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static BusRelations => 0

    /**
     * @type {Integer (Int32)}
     */
    static EjectionRelations => 1

    /**
     * @type {Integer (Int32)}
     */
    static PowerRelations => 2

    /**
     * @type {Integer (Int32)}
     */
    static RemovalRelations => 3

    /**
     * @type {Integer (Int32)}
     */
    static TargetDeviceRelation => 4

    /**
     * @type {Integer (Int32)}
     */
    static SingleBusRelations => 5

    /**
     * @type {Integer (Int32)}
     */
    static TransportRelations => 6
}
