#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ADRENTRY.ahk

/**
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class ADRLIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cEntries {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<ADRENTRY>}
     */
    aEntries{
        get {
            if(!this.HasProp("__aEntriesProxyArray"))
                this.__aEntriesProxyArray := Win32FixedArray(this.ptr + 8, 1, ADRENTRY, "")
            return this.__aEntriesProxyArray
        }
    }
}
