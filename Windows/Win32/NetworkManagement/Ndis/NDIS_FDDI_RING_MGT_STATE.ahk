#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
class NDIS_FDDI_RING_MGT_STATE extends Win32Enum {

    /**
     * Native name: NdisFddiRingIsolated
     * @type {Integer (Int32)}
     */
    static Isolated => 1

    /**
     * Native name: NdisFddiRingNonOperational
     * @type {Integer (Int32)}
     */
    static NonOperational => 2

    /**
     * Native name: NdisFddiRingOperational
     * @type {Integer (Int32)}
     */
    static Operational => 3

    /**
     * Native name: NdisFddiRingDetect
     * @type {Integer (Int32)}
     */
    static Detect => 4

    /**
     * Native name: NdisFddiRingNonOperationalDup
     * @type {Integer (Int32)}
     */
    static NonOperationalDup => 5

    /**
     * Native name: NdisFddiRingOperationalDup
     * @type {Integer (Int32)}
     */
    static OperationalDup => 6

    /**
     * Native name: NdisFddiRingDirected
     * @type {Integer (Int32)}
     */
    static Directed => 7

    /**
     * Native name: NdisFddiRingTrace
     * @type {Integer (Int32)}
     */
    static Trace => 8
}
