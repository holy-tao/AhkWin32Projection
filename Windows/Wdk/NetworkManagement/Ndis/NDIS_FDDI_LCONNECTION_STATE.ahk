#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
class NDIS_FDDI_LCONNECTION_STATE extends Win32Enum {

    /**
     * Native name: NdisFddiStateOff
     * @type {Integer (Int32)}
     */
    static Off => 1

    /**
     * Native name: NdisFddiStateBreak
     * @type {Integer (Int32)}
     */
    static Break => 2

    /**
     * Native name: NdisFddiStateTrace
     * @type {Integer (Int32)}
     */
    static Trace => 3

    /**
     * Native name: NdisFddiStateConnect
     * @type {Integer (Int32)}
     */
    static Connect => 4

    /**
     * Native name: NdisFddiStateNext
     * @type {Integer (Int32)}
     */
    static Next => 5

    /**
     * Native name: NdisFddiStateSignal
     * @type {Integer (Int32)}
     */
    static Signal => 6

    /**
     * Native name: NdisFddiStateJoin
     * @type {Integer (Int32)}
     */
    static Join => 7

    /**
     * Native name: NdisFddiStateVerify
     * @type {Integer (Int32)}
     */
    static Verify => 8

    /**
     * Native name: NdisFddiStateActive
     * @type {Integer (Int32)}
     */
    static Active => 9

    /**
     * Native name: NdisFddiStateMaintenance
     * @type {Integer (Int32)}
     */
    static Maintenance => 10
}
