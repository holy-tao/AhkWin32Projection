#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DEVPROP_PCIEXPRESSDEVICE_SPEC_VERSION {
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
    static DevProp_PciExpressDevice_Spec_Version_10 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DevProp_PciExpressDevice_Spec_Version_11 => 2
}
