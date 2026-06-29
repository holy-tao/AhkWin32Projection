#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * Contains an array of time values that are used to describe a property of type PT_MV_SYSTIME for Outlook 2013 or Outlook 2016.
 * @remarks
 * For more information about PT_MV_SYSTIME, see [List of Property Types](property-types.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/sdatetimearray
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct SDateTimeArray {
    #StructPack 8

    /**
     * > Count of values in the array pointed to by the **lpft** member.
     */
    cValues : UInt32

    /**
     * > Pointer to an array of [FILETIME](filetime.md) structures that contain the time values.
     */
    lpft : FILETIME.Ptr

}
