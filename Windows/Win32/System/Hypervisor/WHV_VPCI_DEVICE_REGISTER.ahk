#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WHV_VPCI_DEVICE_REGISTER_SPACE.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
class WHV_VPCI_DEVICE_REGISTER extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {WHV_VPCI_DEVICE_REGISTER_SPACE}
     */
    Location {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    SizeInBytes {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    OffsetInBytes {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
