#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SRestriction.ahk" { SRestriction }

/**
 * Describes an OR restriction which is used to apply a logical OR operation to a restriction. 
 * @remarks
 * For more information about the **SOrRestriction** structure, see [About Restrictions](about-restrictions.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/sorrestriction
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct SOrRestriction {
    #StructPack 8

    /**
     * > Count of structures in the array pointed to by the **lpRes** member.
     */
    cRes : UInt32

    __lpRes_ptr : IntPtr
    /**
     * > Pointer to the [SRestriction](srestriction.md) structure describing the restriction to be joined using the logical **OR** operation.
     */
    lpRes {
        get => (addr := this.__lpRes_ptr) ? SRestriction.At(addr) : unset
        set => this.__lpRes_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

}
