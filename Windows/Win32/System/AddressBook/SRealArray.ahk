#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains an array of float values that are used to describe a property of type PT_MV_R4.
 * @remarks
 * For more information about the PT_MV_R4 property type, see [Property Types](property-types.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/srealarray
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct SRealArray {
    #StructPack 8

    /**
     * > Count of values in the array pointed to by the **lpflt** member.
     */
    cValues : UInt32

    /**
     * > Pointer to an array of float values.
     */
    lpflt : IntPtr

}
