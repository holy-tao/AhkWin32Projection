#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SPropProblem.ahk" { SPropProblem }

/**
 * Contains an array of one or more SPropProblem structures for Outlook 2013 and Outlook 2016.
 * @remarks
 * For more information about how the **SPropProblem** and **SPropProblemArray** structures work with errors related to properties, see [MAPI Named Properties](mapi-named-properties.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/spropproblemarray
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct SPropProblemArray {
    #StructPack 4

    /**
     * > Count of [SPropProblem](spropproblem.md) structures in the array indicated by the **aProblem** member.
     */
    cProblem : UInt32

    /**
     * > Array of **SPropProblem** structures, each describing a property error.
     */
    aProblem : SPropProblem[1]

}
