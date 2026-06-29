#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DEVPROP_PCIDEVICE_SRIOVSUPPORT {
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
    static DevProp_PciDevice_SriovSupport_Ok => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DevProp_PciDevice_SriovSupport_MissingAcs => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DevProp_PciDevice_SriovSupport_MissingPfDriver => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DevProp_PciDevice_SriovSupport_NoBusResource => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DevProp_PciDevice_SriovSupport_DidntGetVfBarSpace => 4
}
