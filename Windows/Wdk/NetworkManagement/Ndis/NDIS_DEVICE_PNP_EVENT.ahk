#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
class NDIS_DEVICE_PNP_EVENT extends Win32Enum {

    /**
     * Native name: NdisDevicePnPEventQueryRemoved
     * @type {Integer (Int32)}
     */
    static PnPEventQueryRemoved => 0

    /**
     * Native name: NdisDevicePnPEventRemoved
     * @type {Integer (Int32)}
     */
    static PnPEventRemoved => 1

    /**
     * Native name: NdisDevicePnPEventSurpriseRemoved
     * @type {Integer (Int32)}
     */
    static PnPEventSurpriseRemoved => 2

    /**
     * Native name: NdisDevicePnPEventQueryStopped
     * @type {Integer (Int32)}
     */
    static PnPEventQueryStopped => 3

    /**
     * Native name: NdisDevicePnPEventStopped
     * @type {Integer (Int32)}
     */
    static PnPEventStopped => 4

    /**
     * Native name: NdisDevicePnPEventPowerProfileChanged
     * @type {Integer (Int32)}
     */
    static PnPEventPowerProfileChanged => 5

    /**
     * Native name: NdisDevicePnPEventMaximum
     * @type {Integer (Int32)}
     */
    static PnPEventMaximum => 6
}
