#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DEVPROP_PCIROOTBUS_BUSWIDTH {
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
    static DevProp_PciRootBus_BusWidth_32Bits => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DevProp_PciRootBus_BusWidth_64Bits => 1
}
