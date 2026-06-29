#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * HDV_PCI_PNP_ID structure
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/hdv/HdvPciPnpId
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct HDV_PCI_PNP_ID {
    #StructPack 2

    /**
     * Vendor ID (lowest two types of config space).
     */
    VendorID : UInt16

    /**
     * Device ID (offset 0x4 of config space).
     */
    DeviceID : UInt16

    /**
     * Device Revision ID (offset 0x8 of config space).
     */
    RevisionID : Int8

    /**
     * Programable interface ID (offset 0x9 of config space).
     */
    ProgIf : Int8

    /**
     * Sub-class code of device (offset 0xA of config space).
     */
    SubClass : Int8

    /**
     * Base class code of device (offset 0xB of config space).
     */
    BaseClass : Int8

    /**
     * Subsystem vendor ID of device (offset 0x2C of config space).
     */
    SubVendorID : UInt16

    /**
     * Subsystem ID of device (offset 0x2E of config space).
     */
    SubSystemID : UInt16

}
