#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a comment restriction, which is used to annotate a restriction. Comment restrictions are unlike other restrictions because they are not evaluated.
 * @remarks
 * The **SCommentRestriction** structure associates an object together with a set of named properties. Comment restrictions are unlike other restrictions because they are not evaluated. That is, they are ignored by the [IMAPITable::Restrict](imapitable-restrict.md) method. There is no effect on the rows returned by the [IMAPITable::QueryRows](imapitable-queryrows.md) method after an **IMAPITable::Restrict** call has been made. 
 *   
 * The **SCommentRestriction** structure can be used to keep application-specific information with a restriction when it is saved on disk. For example, a client saving the name of a named property used in a property restriction can do so in an **SCommentRestriction** structure. Saving a property name is not possible in a property restriction because the associated [SPropertyRestriction](spropertyrestriction.md) structure holds only the property tag. 
 *   
 * For more information about the **SCommentRestriction** structure and restrictions in general, see [About Restrictions](about-restrictions.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/scommentrestriction
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class SCommentRestriction extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * > Count of property values in the array pointed to by the **lpProp** member.
     * @type {Integer}
     */
    cValues {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * > Pointer to an [SRestriction](srestriction.md) structure.
     * @type {Pointer<SRestriction>}
     */
    lpRes {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * > Pointer to an array of [SPropValue](spropvalue.md) structures, each containing the property tag and value for a named property.
     * @type {Pointer<SPropValue>}
     */
    lpProp {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
