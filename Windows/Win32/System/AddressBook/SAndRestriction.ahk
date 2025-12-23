#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes an AND restriction, which is used to join a group of restrictions using a logical AND operation.
 * @remarks
 * The result of the **SAndRestriction** is TRUE if all its child restrictions evaluate to TRUE. It is FALSE if any child restriction evaluates to FALSE. 
 *   
 * For a description of types of restrictions, how to build them, and sample code, see [About Restrictions](about-restrictions.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/sandrestriction
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class SAndRestriction extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * > Count of search restrictions in the array pointed to by the **lpRes** member.
     * @type {Integer}
     */
    cRes {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * > Pointer to an array of [SRestriction](srestriction.md) structures that will be combined with a logical **AND** operation.
     * @type {Pointer<SRestriction>}
     */
    lpRes {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
