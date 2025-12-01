#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a sub-object restriction which is used to filter the rows of a message's attachment or recipient table.
 * @remarks
 * Sub-object restrictions are not supported by all tables. Typically, only folder contents tables and search results folders support them. For example, sub-object restrictions are used to find a message that has a particular type of attachment or recipient.
 *   
 * If an implementation does not support sub-object restrictions, it returns MAPI_E_TOO_COMPLEX from its [IMAPITable::Restrict](imapitable-restrict.md) or [IMAPITable::FindRow](imapitable-findrow.md) methods.
 *   
 * For a general discussion of how restrictions work, see [About Restrictions](about-restrictions.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/ssubrestriction
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class SSubRestriction extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * > Type of sub-object to serve as the target for the restriction. Possible values are as follows:
     * 
     * PR_MESSAGE_RECIPIENTS
     *   
     * > Apply the restriction to a message's recipient table.
     * 
     * PR_MESSAGE_ATTACHMENTS
     *   
     * > Apply the restriction to a message's attachment table.
     * @type {Integer}
     */
    ulSubObject {
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
}
