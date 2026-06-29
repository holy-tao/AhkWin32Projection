#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains an array of unsigned integer values that are used to describe a property of type PT_MV_SHORT.
 * @remarks
 * For more information about PT_MV_SHORT and other property types, see [Property Types](property-types.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/sshortarray
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct SShortArray {
    #StructPack 8

    /**
     * > Count of values in the array pointed to by the **lpi** member.
     */
    cValues : UInt32

    /**
     * > Pointer to an array of unsigned integer values.
     */
    lpi : IntPtr

}
