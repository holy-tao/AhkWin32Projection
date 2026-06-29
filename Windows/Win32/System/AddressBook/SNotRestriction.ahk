#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SRestriction.ahk" { SRestriction }

/**
 * Describes a NOT restriction, which is used to apply a logical NOT operation to a restriction.
 * @remarks
 * For more information about the **SNotRestriction** structure, see [About Restrictions](about-restrictions.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/snotrestriction
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct SNotRestriction {
    #StructPack 8

    /**
     * > [in] Reserved; must be zero.
     */
    ulReserved : UInt32

    __lpRes_ptr : IntPtr
    /**
     * > Pointer to a [SRestriction](srestriction.md) structure describing the restriction to be joined to the logical **NOT** operator.
     */
    lpRes {
        get => (addr := this.__lpRes_ptr) ? SRestriction.At(addr) : unset
        set => this.__lpRes_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

}
