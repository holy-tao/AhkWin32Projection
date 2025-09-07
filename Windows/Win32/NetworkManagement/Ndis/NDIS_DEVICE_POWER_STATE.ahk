#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_DEVICE_POWER_STATE{

    /**
     * @type {Integer (Int32)}
     */
    static NdisDeviceStateUnspecified => 0

    /**
     * @type {Integer (Int32)}
     */
    static NdisDeviceStateD0 => 1

    /**
     * @type {Integer (Int32)}
     */
    static NdisDeviceStateD1 => 2

    /**
     * @type {Integer (Int32)}
     */
    static NdisDeviceStateD2 => 3

    /**
     * @type {Integer (Int32)}
     */
    static NdisDeviceStateD3 => 4

    /**
     * @type {Integer (Int32)}
     */
    static NdisDeviceStateMaximum => 5
}
