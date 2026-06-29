#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains an array of LARGE_INTEGER structures that are used to describe a property of type PT_MV_I8.
 * @remarks
 * For more information about PT_MV_18, see [List of Property Types](property-types.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/slargeintegerarray
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct SLargeIntegerArray {
    #StructPack 8

    /**
     * > Count of values in the array pointed to by the **lpli** member.
     */
    cValues : UInt32

    /**
     * > Pointer to an array of **LARGE_INTEGER** structures holding the integer values.
     */
    lpli : IntPtr

}
