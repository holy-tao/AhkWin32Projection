#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * HDV_PCI_PNP_ID structure
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/hdv/HdvPciPnpId
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class HDV_PCI_PNP_ID extends Win32Struct
{
    static sizeof => 12

    static packingSize => 2

    /**
     * Vendor ID (lowest two types of config space).
     * @type {Integer}
     */
    VendorID {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Device ID (offset 0x4 of config space).
     * @type {Integer}
     */
    DeviceID {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Device Revision ID (offset 0x8 of config space).
     * @type {Integer}
     */
    RevisionID {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * Programable interface ID (offset 0x9 of config space).
     * @type {Integer}
     */
    ProgIf {
        get => NumGet(this, 5, "char")
        set => NumPut("char", value, this, 5)
    }

    /**
     * Sub-class code of device (offset 0xA of config space).
     * @type {Integer}
     */
    SubClass {
        get => NumGet(this, 6, "char")
        set => NumPut("char", value, this, 6)
    }

    /**
     * Base class code of device (offset 0xB of config space).
     * @type {Integer}
     */
    BaseClass {
        get => NumGet(this, 7, "char")
        set => NumPut("char", value, this, 7)
    }

    /**
     * Subsystem vendor ID of device (offset 0x2C of config space).
     * @type {Integer}
     */
    SubVendorID {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * Subsystem ID of device (offset 0x2E of config space).
     * @type {Integer}
     */
    SubSystemID {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }
}
