#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ADRENTRY.ahk

/**
 * ADRLIST (wabdefs.h) - do not use. Describes zero or more properties belonging to one or more recipients.G
 * @see https://learn.microsoft.com/windows/win32/api//content/wabdefs/ns-wabdefs-adrlist
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class ADRLIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>ULONG</b>
     * 
     * Variable of type <b>ULONG</b> that specifies the entry count in the array specified by the <b>aEntries</b> member.
     * @type {Integer}
     */
    cEntries {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wabdefs/ns-wabdefs-adrentry">ADRENTRY</a>[MAPI_DIM]</b>
     * 
     * Variable of type <a href="https://docs.microsoft.com/windows/desktop/api/wabdefs/ns-wabdefs-adrentry">ADRENTRY</a> that specifies the array of <b>ADRENTRY</b> structures, one structure for each recipient.
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
