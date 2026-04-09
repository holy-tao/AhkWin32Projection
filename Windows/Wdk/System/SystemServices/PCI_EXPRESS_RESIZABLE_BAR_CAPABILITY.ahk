#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class PCI_EXPRESS_RESIZABLE_BAR_CAPABILITY extends Win32Struct {
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    Header {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Array<Pointer>}
     */
    Entry {
        get {
            if(!this.HasProp("__EntryProxyArray"))
                this.__EntryProxyArray := Win32FixedArray(this.ptr + 8, 6, Primitive, "ptr")
            return this.__EntryProxyArray
        }
    }
}
