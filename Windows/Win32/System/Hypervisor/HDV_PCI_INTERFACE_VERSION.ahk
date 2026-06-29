#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * HDV_PCI_INTERFACE_VERSION Enumeration
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/hdv/HdvPciInterfaceVersion
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct HDV_PCI_INTERFACE_VERSION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static HdvPciDeviceInterfaceVersionInvalid => 0

    /**
     * @type {Integer (Int32)}
     */
    static HdvPciDeviceInterfaceVersion1 => 1
}
