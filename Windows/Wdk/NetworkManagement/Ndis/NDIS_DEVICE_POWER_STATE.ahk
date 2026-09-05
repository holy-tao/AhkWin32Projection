#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
class NDIS_DEVICE_POWER_STATE extends Win32Enum {

    /**
     * Native name: NdisDeviceStateUnspecified
     * @type {Integer (Int32)}
     */
    static Unspecified => 0

    /**
     * Native name: NdisDeviceStateD0
     * @type {Integer (Int32)}
     */
    static StateD0 => 1

    /**
     * Native name: NdisDeviceStateD1
     * @type {Integer (Int32)}
     */
    static StateD1 => 2

    /**
     * Native name: NdisDeviceStateD2
     * @type {Integer (Int32)}
     */
    static StateD2 => 3

    /**
     * Native name: NdisDeviceStateD3
     * @type {Integer (Int32)}
     */
    static StateD3 => 4

    /**
     * Native name: NdisDeviceStateMaximum
     * @type {Integer (Int32)}
     */
    static Maximum => 5
}
