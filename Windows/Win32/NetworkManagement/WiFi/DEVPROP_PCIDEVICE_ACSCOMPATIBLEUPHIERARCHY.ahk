#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DEVPROP_PCIDEVICE_ACSCOMPATIBLEUPHIERARCHY{

    /**
     * @type {Integer (UInt32)}
     */
    static DevProp_PciDevice_AcsCompatibleUpHierarchy_NotSupported => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DevProp_PciDevice_AcsCompatibleUpHierarchy_SingleFunctionSupported => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DevProp_PciDevice_AcsCompatibleUpHierarchy_NoP2PSupported => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DevProp_PciDevice_AcsCompatibleUpHierarchy_Supported => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DevProp_PciDevice_AcsCompatibleUpHierarchy_Enhanced => 4
}
