#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DEVPROP_PCIROOTBUS_SECONDARYINTERFACE {
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
    static DevProp_PciRootBus_SecondaryInterface_PciConventional => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DevProp_PciRootBus_SecondaryInterface_PciXMode1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DevProp_PciRootBus_SecondaryInterface_PciXMode2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DevProp_PciRootBus_SecondaryInterface_PciExpress => 3
}
