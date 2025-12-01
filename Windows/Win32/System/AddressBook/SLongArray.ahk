#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains an array of LONG value types that are used to describe a property of type PT_MV_LONG.
 * @remarks
 * For more information about PT_MV_LONG, see [List of Property Types](property-types.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/slongarray
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class SLongArray extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * > Count of values in the array pointed to by the **lpl** member.
     * @type {Integer}
     */
    cValues {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * > Pointer to an array of LONG values.
     * @type {Pointer<Integer>}
     */
    lpl {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
