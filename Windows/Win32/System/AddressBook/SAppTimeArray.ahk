#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains an array of time values. The SAppTimeArray structure is used to define properties of type PT_MV_APPTIME.
 * @remarks
 * The **SAppTimeArray** structure is used to define properties of type PT_MV_APPTIME. For more information about PT_MV_APPTIME, see [List of Property Types](property-types.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/sapptimearray
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct SAppTimeArray {
    #StructPack 8

    /**
     * > Count of values in the array pointed to by the **lpat** member.
     */
    cValues : UInt32

    /**
     * > Pointer to an array of application time values.
     */
    lpat : IntPtr

}
