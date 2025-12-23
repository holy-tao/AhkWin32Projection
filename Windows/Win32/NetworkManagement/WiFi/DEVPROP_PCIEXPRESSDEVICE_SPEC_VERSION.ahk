#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DEVPROP_PCIEXPRESSDEVICE_SPEC_VERSION extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static DevProp_PciExpressDevice_Spec_Version_10 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DevProp_PciExpressDevice_Spec_Version_11 => 2
}
