#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DEVPROP_PCIROOTBUS_SECONDARYINTERFACE extends Win32Enum{

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
