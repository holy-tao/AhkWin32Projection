#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains an array of FLATENTRY structures.
 * @remarks
 * In the **abEntries** array, each **FLATENTRY** structure is aligned on a naturally aligned boundary. Extra bytes are included as padding to make sure natural alignment between any two **FLATENTRY** structures. The first **FLATENTRY** structure in the array is always aligned correctly because the offset of the **abEntries** member is 8. To compute the offset of the next structure, use the size of the first entry rounded up to the next multiple of 4. Use the [CbFLATENTRY](cbflatentry.md) macro to compute the size of a **FLATENTRY** structure.
  *   
  * For example, the second **FLATENTRY** structure starts at an offset that consists of the offset of the first entry plus the length of the first entry rounded to the next four bytes. The length of the first entry is the length of its **cb** member plus the length of its **abEntry** member.
  *   
  * The following code sample indicates how to compute offsets in a **FLATENTRYLIST** structure. Assume that _lpFlatEntry_ is a pointer to the first structure in the list.
  *   
  * ```cpp
  * (offsetof(lpFlatEntry->ab) // for example, 4
  * + lpFlatEntry->cb // size of lpFlatEntry->ab 
  * + 4) & ~3 // round to next 4 byte boundary
  * ```
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/flatentrylist
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class FLATENTRYLIST extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * > Count of **FLATENTRY** structures in the array described by the **abEntries** member.
     * @type {Integer}
     */
    cEntries {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * > Count of bytes in the array described by **abEntries**.
     * @type {Integer}
     */
    cbEntries {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * > Byte array that contains one or more **FLATENTRY** structures, arranged end to end.
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
