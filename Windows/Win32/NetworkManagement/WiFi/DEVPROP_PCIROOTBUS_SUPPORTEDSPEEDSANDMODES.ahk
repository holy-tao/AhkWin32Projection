#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DEVPROP_PCIROOTBUS_SUPPORTEDSPEEDSANDMODES extends Win32Enum{

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
