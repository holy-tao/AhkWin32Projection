#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
class NDIS_HARDWARE_STATUS extends Win32Enum {

    /**
     * Native name: NdisHardwareStatusReady
     * @type {Integer (Int32)}
     */
    static Ready => 0

    /**
     * Native name: NdisHardwareStatusInitializing
     * @type {Integer (Int32)}
     */
    static Initializing => 1

    /**
     * Native name: NdisHardwareStatusReset
     * @type {Integer (Int32)}
     */
    static Reset => 2

    /**
     * Native name: NdisHardwareStatusClosing
     * @type {Integer (Int32)}
     */
    static Closing => 3

    /**
     * Native name: NdisHardwareStatusNotReady
     * @type {Integer (Int32)}
     */
    static NotReady => 4
}
