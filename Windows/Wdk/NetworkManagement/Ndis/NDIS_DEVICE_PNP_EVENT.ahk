#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_DEVICE_PNP_EVENT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NdisDevicePnPEventQueryRemoved => 0

    /**
     * @type {Integer (Int32)}
     */
    static NdisDevicePnPEventRemoved => 1

    /**
     * @type {Integer (Int32)}
     */
    static NdisDevicePnPEventSurpriseRemoved => 2

    /**
     * @type {Integer (Int32)}
     */
    static NdisDevicePnPEventQueryStopped => 3

    /**
     * @type {Integer (Int32)}
     */
    static NdisDevicePnPEventStopped => 4

    /**
     * @type {Integer (Int32)}
     */
    static NdisDevicePnPEventPowerProfileChanged => 5

    /**
     * @type {Integer (Int32)}
     */
    static NdisDevicePnPEventMaximum => 6
}
