#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Outlines SBinary, including a description of property type PT_BINARY. This applies to Outlook 2013 and Outlook 2016.
 * @remarks
 * For information about property types, see [MAPI Property Type Overview](mapi-property-type-overview.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/sbinary
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class SBinary extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * > Count of bytes in the **lpb** member.
     * @type {Integer}
     */
    cb {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * > Pointer to the PT_BINARY property value.
     * @type {Pointer<Integer>}
     */
    lpb {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
