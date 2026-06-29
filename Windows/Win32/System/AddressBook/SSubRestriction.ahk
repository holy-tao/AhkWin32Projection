#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SRestriction.ahk" { SRestriction }

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
 */
export default struct SSubRestriction {
    #StructPack 8

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
     */
    ulSubObject : UInt32

    __lpRes_ptr : IntPtr
    /**
     * > Pointer to an [SRestriction](srestriction.md) structure.
     */
    lpRes {
        get => (addr := this.__lpRes_ptr) ? SRestriction.At(addr) : unset
        set => this.__lpRes_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

}
