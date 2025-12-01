#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes an OR restriction which is used to apply a logical OR operation to a restriction. 
 * @remarks
 * For more information about the **SOrRestriction** structure, see [About Restrictions](about-restrictions.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/sorrestriction
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class SOrRestriction extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * > Count of structures in the array pointed to by the **lpRes** member.
     * @type {Integer}
     */
    cRes {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * > Pointer to the [SRestriction](srestriction.md) structure describing the restriction to be joined using the logical **OR** operation.
     * @type {Pointer<SRestriction>}
     */
    lpRes {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
