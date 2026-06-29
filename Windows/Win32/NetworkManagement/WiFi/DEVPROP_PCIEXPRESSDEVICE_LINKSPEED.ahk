#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DEVPROP_PCIEXPRESSDEVICE_LINKSPEED {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static DevProp_PciExpressDevice_LinkSpeed_TwoAndHalf_Gbps => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DevProp_PciExpressDevice_LinkSpeed_Five_Gbps => 2
}
