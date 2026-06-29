#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DEVPROP_PCIROOTBUS_SUPPORTEDSPEEDSANDMODES {
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
    static DevProp_PciRootBus_SupportedSpeedsAndModes_Pci_Conventional_33Mhz => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DevProp_PciRootBus_SupportedSpeedsAndModes_Pci_Conventional_66Mhz => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DevProp_PciRootBus_SupportedSpeedsAndModes_Pci_X_66Mhz => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DevProp_PciRootBus_SupportedSpeedsAndModes_Pci_X_133Mhz => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DevProp_PciRootBus_SupportedSpeedsAndModes_Pci_X_266Mhz => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DevProp_PciRootBus_SupportedSpeedsAndModes_Pci_X_533Mhz => 32
}
