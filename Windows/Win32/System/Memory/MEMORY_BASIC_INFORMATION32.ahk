#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PAGE_PROTECTION_FLAGS.ahk
#Include .\VIRTUAL_ALLOCATION_TYPE.ahk
#Include .\PAGE_TYPE.ahk

/**
 * @namespace Windows.Win32.System.Memory
 */
class MEMORY_BASIC_INFORMATION32 extends Win32Struct {
    static sizeof => 28

    static packingSize => 4

    /**
     * @type {Integer}
     */
    BaseAddress {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    AllocationBase {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {PAGE_PROTECTION_FLAGS}
     */
    AllocationProtect {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    RegionSize {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {VIRTUAL_ALLOCATION_TYPE}
     */
    State {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {PAGE_PROTECTION_FLAGS}
     */
    Protect {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {PAGE_TYPE}
     */
    Type {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
