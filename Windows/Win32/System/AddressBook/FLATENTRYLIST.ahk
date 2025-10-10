#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class FLATENTRYLIST extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    cEntries {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    cbEntries {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<Byte>}
     */
    abEntries{
        get {
            if(!this.HasProp("__abEntriesProxyArray"))
                this.__abEntriesProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__abEntriesProxyArray
        }
    }
}
