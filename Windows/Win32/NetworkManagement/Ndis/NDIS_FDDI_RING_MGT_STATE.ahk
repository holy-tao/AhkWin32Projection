#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_FDDI_RING_MGT_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiRingIsolated => 1

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiRingNonOperational => 2

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiRingOperational => 3

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiRingDetect => 4

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiRingNonOperationalDup => 5

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiRingOperationalDup => 6

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiRingDirected => 7

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiRingTrace => 8
}
