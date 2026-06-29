#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains an array of doubles used to describe a property of type PT_MV_DOUBLE for Outlook 2013 or Outlook 2016.
 * @remarks
 * For more information about PT_MV_DOUBLE, see [List of Property Types](property-types.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/sdoublearray
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct SDoubleArray {
    #StructPack 8

    /**
     * > Count of values in the array pointed to by the **lpdbl** member.
     */
    cValues : UInt32

    /**
     * > Pointer to an array of double values.
     */
    lpdbl : IntPtr

}
