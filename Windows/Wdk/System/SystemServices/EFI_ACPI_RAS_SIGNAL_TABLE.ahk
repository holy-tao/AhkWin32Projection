#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class EFI_ACPI_RAS_SIGNAL_TABLE extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    Header {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    NumberRecord {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<Pointer>}
     */
    Entries {
        get {
            if(!this.HasProp("__EntriesProxyArray"))
                this.__EntriesProxyArray := Win32FixedArray(this.ptr + 16, 1, Primitive, "ptr")
            return this.__EntriesProxyArray
        }
    }
}
