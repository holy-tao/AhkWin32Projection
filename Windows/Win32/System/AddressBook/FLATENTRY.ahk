#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class FLATENTRY extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    cb {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    abEntry{
        get {
            if(!this.HasProp("__abEntryProxyArray"))
                this.__abEntryProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__abEntryProxyArray
        }
    }
}
