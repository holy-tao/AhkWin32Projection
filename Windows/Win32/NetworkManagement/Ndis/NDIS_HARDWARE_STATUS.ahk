#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_HARDWARE_STATUS{

    /**
     * @type {Integer (Int32)}
     */
    static NdisHardwareStatusReady => 0

    /**
     * @type {Integer (Int32)}
     */
    static NdisHardwareStatusInitializing => 1

    /**
     * @type {Integer (Int32)}
     */
    static NdisHardwareStatusReset => 2

    /**
     * @type {Integer (Int32)}
     */
    static NdisHardwareStatusClosing => 3

    /**
     * @type {Integer (Int32)}
     */
    static NdisHardwareStatusNotReady => 4
}
