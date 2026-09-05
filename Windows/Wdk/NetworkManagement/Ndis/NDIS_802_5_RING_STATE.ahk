#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
class NDIS_802_5_RING_STATE extends Win32Enum {

    /**
     * Native name: NdisRingStateOpened
     * @type {Integer (Int32)}
     */
    static Opened => 1

    /**
     * Native name: NdisRingStateClosed
     * @type {Integer (Int32)}
     */
    static Closed => 2

    /**
     * Native name: NdisRingStateOpening
     * @type {Integer (Int32)}
     */
    static Opening => 3

    /**
     * Native name: NdisRingStateClosing
     * @type {Integer (Int32)}
     */
    static Closing => 4

    /**
     * Native name: NdisRingStateOpenFailure
     * @type {Integer (Int32)}
     */
    static OpenFailure => 5

    /**
     * Native name: NdisRingStateRingFailure
     * @type {Integer (Int32)}
     */
    static RingFailure => 6
}
