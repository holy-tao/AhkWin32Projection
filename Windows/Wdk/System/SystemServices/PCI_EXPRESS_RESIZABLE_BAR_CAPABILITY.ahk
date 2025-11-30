#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PCI_EXPRESS_RESIZABLE_BAR_ENTRY.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PCI_EXPRESS_RESIZABLE_BAR_CAPABILITY extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {Pointer<PCI_EXPRESS_ENHANCED_CAPABILITY_HEADER>}
     */
    Header {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Array<PCI_EXPRESS_RESIZABLE_BAR_ENTRY>}
     */
    Entry{
        get {
            if(!this.HasProp("__EntryProxyArray"))
                this.__EntryProxyArray := Win32FixedArray(this.ptr + 8, 6, Primitive, "ptr")
            return this.__EntryProxyArray
        }
    }
}
