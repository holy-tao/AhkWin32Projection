#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DEVPROP_PCIDEVICE_ACSSUPPORT extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static DevProp_PciDevice_AcsSupport_Present => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DevProp_PciDevice_AcsSupport_NotNeeded => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DevProp_PciDevice_AcsSupport_Missing => 2
}
