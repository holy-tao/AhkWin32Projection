#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains an array of doubles used to describe a property of type PT_MV_DOUBLE for Outlook 2013 or Outlook 2016.
 * @remarks
 * For more information about PT_MV_DOUBLE, see [List of Property Types](property-types.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/sdoublearray
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class SDoubleArray extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * > Count of values in the array pointed to by the **lpdbl** member.
     * @type {Integer}
     */
    cValues {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * > Pointer to an array of double values.
     * @type {Pointer<Float>}
     */
    lpdbl {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
