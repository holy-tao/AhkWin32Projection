#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains an array of LONG value types that are used to describe a property of type PT_MV_LONG.
 * @remarks
 * For more information about PT_MV_LONG, see [List of Property Types](property-types.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/slongarray
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct SLongArray {
    #StructPack 8

    /**
     * > Count of values in the array pointed to by the **lpl** member.
     */
    cValues : UInt32

    /**
     * > Pointer to an array of LONG values.
     */
    lpl : IntPtr

}
