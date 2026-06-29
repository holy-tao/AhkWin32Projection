#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Com\CY.ahk" { CY }

/**
 * Contains an array of currency values that are used to describe a property of type PT_MV_CURRENCY.
 * @remarks
 * For information about PT_MV_CURRENCY, see [List of Property Types](property-types.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/scurrencyarray
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct SCurrencyArray {
    #StructPack 8

    /**
     * > Count of values in the array pointed to by the **lpcur** member.
     */
    cValues : UInt32

    /**
     * > Pointer to an array of [CURRENCY](currency.md) structures that contain the currency values.
     */
    lpcur : CY.Ptr

}
