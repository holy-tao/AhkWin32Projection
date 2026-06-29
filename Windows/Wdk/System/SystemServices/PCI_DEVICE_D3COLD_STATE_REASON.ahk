#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_DEVICE_D3COLD_STATE_REASON {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
