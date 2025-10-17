#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\WOW64_LDT_ENTRY.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class WOW64_DESCRIPTOR_TABLE_ENTRY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Selector {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {WOW64_LDT_ENTRY}
     */
    Descriptor{
        get {
            if(!this.HasProp("__Descriptor"))
                this.__Descriptor := WOW64_LDT_ENTRY(8, this)
            return this.__Descriptor
        }
    }
}
