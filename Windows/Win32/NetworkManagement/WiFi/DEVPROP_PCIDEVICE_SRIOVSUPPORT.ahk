#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DEVPROP_PCIDEVICE_SRIOVSUPPORT extends Win32Enum{

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
