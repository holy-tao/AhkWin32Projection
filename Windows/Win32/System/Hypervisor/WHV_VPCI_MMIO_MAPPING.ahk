#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WHV_VPCI_DEVICE_REGISTER_SPACE.ahk
#Include .\WHV_VPCI_MMIO_RANGE_FLAGS.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
class WHV_VPCI_MMIO_MAPPING extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {WHV_VPCI_DEVICE_REGISTER_SPACE}
     */
    Location {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {WHV_VPCI_MMIO_RANGE_FLAGS}
     */
    Flags {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    SizeInBytes {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    OffsetInBytes {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Pointer<Void>}
     */
    VirtualAddress {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
