#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DEVPROP_PCIDEVICE_ACSCOMPATIBLEUPHIERARCHY {
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
