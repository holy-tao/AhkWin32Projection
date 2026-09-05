#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class PCI_DEVICE_D3COLD_STATE_REASON extends Win32Enum {

    /**
     * Native name: PciDeviceD3Cold_State_Disabled_BitIndex
     * @type {Integer (Int32)}
     */
    static Disabled_BitIndex => 1

    /**
     * Native name: PciDeviceD3Cold_State_Enabled_BitIndex
     * @type {Integer (Int32)}
     */
    static Enabled_BitIndex => 2

    /**
     * Native name: PciDeviceD3Cold_State_ParentRootPortS0WakeSupported_BitIndex
     * @type {Integer (Int32)}
     */
    static ParentRootPortS0WakeSupported_BitIndex => 3

    /**
     * Native name: PciDeviceD3Cold_State_Disabled_Bridge_HackFlags_BitIndex
     * @type {Integer (Int32)}
     */
    static Disabled_Bridge_HackFlags_BitIndex => 4

    /**
     * Native name: PciDeviceD3Cold_Reason_Default_State_BitIndex
     * @type {Integer (Int32)}
     */
    static Default_State_BitIndex => 8

    /**
     * Native name: PciDeviceD3Cold_Reason_INF_BitIndex
     * @type {Integer (Int32)}
     */
    static INF_BitIndex => 9

    /**
     * Native name: PciDeviceD3Cold_Reason_Interface_Api_BitIndex
     * @type {Integer (Int32)}
     */
    static Interface_Api_BitIndex => 10
}
