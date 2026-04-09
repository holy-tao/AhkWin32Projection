#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WHV_X64_APIC_WRITE_TYPE.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
class WHV_X64_APIC_WRITE_CONTEXT extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {WHV_X64_APIC_WRITE_TYPE}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    WriteValue {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
