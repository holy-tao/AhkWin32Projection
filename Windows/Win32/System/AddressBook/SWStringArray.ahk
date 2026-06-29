#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains an array of character strings that are used to describe a property of type PT_MV_UNICODE.
 * @remarks
 * For more information about PT_MV_UNICODE, see [Property Types](property-types.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/swstringarray
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct SWStringArray {
    #StructPack 8

    /**
     * > Count of strings in the array pointed to by the **lppszW** member.
     */
    cValues : UInt32

    /**
     * > Pointer to an array of null-ended Unicode character strings.
     */
    lppszW : PWSTR.Ptr

}
