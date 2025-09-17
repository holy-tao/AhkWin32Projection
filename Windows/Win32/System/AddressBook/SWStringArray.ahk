#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains an array of character strings that are used to describe a property of type PT_MV_UNICODE.
 * @remarks
 * For more information about PT_MV_UNICODE, see [Property Types](property-types.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/swstringarray
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class SWStringArray extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * > Count of strings in the array pointed to by the **lppszW** member.
     * @type {Integer}
     */
    cValues {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * > Pointer to an array of null-ended Unicode character strings.
     * @type {Pointer<Char>}
     */
    lppszW {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
