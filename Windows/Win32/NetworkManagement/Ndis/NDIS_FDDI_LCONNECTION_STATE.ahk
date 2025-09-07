#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_FDDI_LCONNECTION_STATE{

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiStateOff => 1

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiStateBreak => 2

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiStateTrace => 3

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiStateConnect => 4

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiStateNext => 5

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiStateSignal => 6

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiStateJoin => 7

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiStateVerify => 8

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiStateActive => 9

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiStateMaintenance => 10
}
