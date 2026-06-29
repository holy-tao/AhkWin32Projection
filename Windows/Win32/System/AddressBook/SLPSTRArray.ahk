#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains an array of string values that are used to describe a property of type PT_MV_STRING8.
 * @remarks
 * For more information about PT_MV_STRING8, see [List of Property Types](property-types.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/slpstrarray
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct SLPSTRArray {
    #StructPack 8

    /**
     * > Count of values in the array pointed to by the **lppszA** member.
     */
    cValues : UInt32

    /**
     * > Pointer to an array of null-ended 8-bit character strings.
     */
    lppszA : PSTR.Ptr

}
