#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PCI_DEVICE_D3COLD_STATE_REASON extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PciDeviceD3Cold_State_Disabled_BitIndex => 1

    /**
     * @type {Integer (Int32)}
     */
    static PciDeviceD3Cold_State_Enabled_BitIndex => 2

    /**
     * @type {Integer (Int32)}
     */
    static PciDeviceD3Cold_State_ParentRootPortS0WakeSupported_BitIndex => 3

    /**
     * @type {Integer (Int32)}
     */
    static PciDeviceD3Cold_State_Disabled_Bridge_HackFlags_BitIndex => 4

    /**
     * @type {Integer (Int32)}
     */
    static PciDeviceD3Cold_Reason_Default_State_BitIndex => 8

    /**
     * @type {Integer (Int32)}
     */
    static PciDeviceD3Cold_Reason_INF_BitIndex => 9

    /**
     * @type {Integer (Int32)}
     */
    static PciDeviceD3Cold_Reason_Interface_Api_BitIndex => 10
}
