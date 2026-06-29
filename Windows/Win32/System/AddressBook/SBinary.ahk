#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Outlines SBinary, including a description of property type PT_BINARY. This applies to Outlook 2013 and Outlook 2016.
 * @remarks
 * For information about property types, see [MAPI Property Type Overview](mapi-property-type-overview.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/sbinary
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct SBinary {
    #StructPack 8

    /**
     * > Count of bytes in the **lpb** member.
     */
    cb : UInt32

    /**
     * > Pointer to the PT_BINARY property value.
     */
    lpb : IntPtr

}
