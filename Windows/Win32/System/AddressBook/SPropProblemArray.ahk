#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SPropProblem.ahk

/**
 * Contains an array of one or more SPropProblem structures for Outlook 2013 and Outlook 2016.
 * @remarks
 * For more information about how the **SPropProblem** and **SPropProblemArray** structures work with errors related to properties, see [MAPI Named Properties](mapi-named-properties.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/spropproblemarray
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class SPropProblemArray extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * > Count of [SPropProblem](spropproblem.md) structures in the array indicated by the **aProblem** member.
     * @type {Integer}
     */
    cProblem {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * > Array of **SPropProblem** structures, each describing a property error.
     * @type {Array<SPropProblem>}
     */
    aProblem{
        get {
            if(!this.HasProp("__aProblemProxyArray"))
                this.__aProblemProxyArray := Win32FixedArray(this.ptr + 8, 8, SPropProblem, "")
            return this.__aProblemProxyArray
        }
    }
}
