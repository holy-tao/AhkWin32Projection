#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DEVPROP_PCIDEVICE_CURRENTSPEEDANDMODE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static DevProp_PciDevice_CurrentSpeedAndMode_Pci_Conventional_33MHz => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DevProp_PciDevice_CurrentSpeedAndMode_Pci_Conventional_66MHz => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DevProp_PciDevice_CurrentSpeedAndMode_PciX_Mode_Conventional_Pci => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DevProp_PciDevice_CurrentSpeedAndMode_PciX_Mode1_66Mhz => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DevProp_PciDevice_CurrentSpeedAndMode_PciX_Mode1_100Mhz => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DevProp_PciDevice_CurrentSpeedAndMode_PciX_Mode1_133MHZ => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DevProp_PciDevice_CurrentSpeedAndMode_PciX_Mode1_ECC_66Mhz => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DevProp_PciDevice_CurrentSpeedAndMode_PciX_Mode1_ECC_100Mhz => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DevProp_PciDevice_CurrentSpeedAndMode_PciX_Mode1_ECC_133Mhz => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DevProp_PciDevice_CurrentSpeedAndMode_PciX_Mode2_266_66MHz => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DevProp_PciDevice_CurrentSpeedAndMode_PciX_Mode2_266_100MHz => 10

    /**
     * @type {Integer (UInt32)}
     */
    static DevProp_PciDevice_CurrentSpeedAndMode_PciX_Mode2_266_133MHz => 11

    /**
     * @type {Integer (UInt32)}
     */
    static DevProp_PciDevice_CurrentSpeedAndMode_PciX_Mode2_533_66MHz => 13

    /**
     * @type {Integer (UInt32)}
     */
    static DevProp_PciDevice_CurrentSpeedAndMode_PciX_Mode2_533_100MHz => 14

    /**
     * @type {Integer (UInt32)}
     */
    static DevProp_PciDevice_CurrentSpeedAndMode_PciX_Mode2_533_133MHz => 15
}
