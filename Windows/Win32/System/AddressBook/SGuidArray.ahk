#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains an array of GUID structures that are used to describe a property of type PT_MV_CLSID.
 * @remarks
 * For more information about PT_MV_CLSID, see [List of Property Types](property-types.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/sguidarray
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class SGuidArray extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * > Count of values in the array pointed to by the **lpguid** member.
     * @type {Integer}
     */
    cValues {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * > Pointer to an array of **GUID** structures that contains the class identifier values.
     * @type {Pointer<Guid>}
     */
    lpguid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
