#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains an array of GUID structures that are used to describe a property of type PT_MV_CLSID.
 * @remarks
 * For more information about PT_MV_CLSID, see [List of Property Types](property-types.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/sguidarray
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct SGuidArray {
    #StructPack 8

    /**
     * > Count of values in the array pointed to by the **lpguid** member.
     */
    cValues : UInt32

    /**
     * > Pointer to an array of **GUID** structures that contains the class identifier values.
     */
    lpguid : Guid.Ptr

}
