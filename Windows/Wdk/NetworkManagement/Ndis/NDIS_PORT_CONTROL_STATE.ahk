#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
class NDIS_PORT_CONTROL_STATE extends Win32Enum {

    /**
     * Native name: NdisPortControlStateUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: NdisPortControlStateControlled
     * @type {Integer (Int32)}
     */
    static Controlled => 1

    /**
     * Native name: NdisPortControlStateUncontrolled
     * @type {Integer (Int32)}
     */
    static Uncontrolled => 2
}
