#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SRestriction.ahk" { SRestriction }

/**
 * Describes an AND restriction, which is used to join a group of restrictions using a logical AND operation.
 * @remarks
 * The result of the **SAndRestriction** is TRUE if all its child restrictions evaluate to TRUE. It is FALSE if any child restriction evaluates to FALSE. 
 *   
 * For a description of types of restrictions, how to build them, and sample code, see [About Restrictions](about-restrictions.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/sandrestriction
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct SAndRestriction {
    #StructPack 8

    /**
     * > Count of search restrictions in the array pointed to by the **lpRes** member.
     */
    cRes : UInt32

    __lpRes_ptr : IntPtr
    /**
     * > Pointer to an array of [SRestriction](srestriction.md) structures that will be combined with a logical **AND** operation.
     */
    lpRes {
        get => (addr := this.__lpRes_ptr) ? SRestriction.At(addr) : unset
        set => this.__lpRes_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

}
