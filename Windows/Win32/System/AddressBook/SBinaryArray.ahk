#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SBinary.ahk" { SBinary }

/**
 * Contains an array of binary values. The SBinaryArray structure is used to describe properties of type PT_MV_BINARY.
 * @remarks
 * The **SBinaryArray** structure is used to describe properties of type PT_MV_BINARY. 
 *   
 * For more information about PT_MV_BINARY, see [List of Property Types](property-types.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/sbinaryarray
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct SBinaryArray {
    #StructPack 8

    /**
     * > Count of values in the array pointed to by the **lpbin** member.
     */
    cValues : UInt32

    /**
     * > Pointer to an array of [SBinary](sbinary.md) structures that holds the binary values.
     */
    lpbin : SBinary.Ptr

}
