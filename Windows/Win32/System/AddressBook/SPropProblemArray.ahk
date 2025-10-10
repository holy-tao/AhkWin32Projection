#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SPropProblem.ahk

/**
 * Do not use. Contains an array of one or more SPropProblem structures.
 * @see https://docs.microsoft.com/windows/win32/api//wabdefs/ns-wabdefs-spropproblemarray
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class SPropProblemArray extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>ULONG</b>
     * 
     * Variable of type <b>ULONG</b> that specifies the count of <a href="https://docs.microsoft.com/windows/desktop/api/wabdefs/ns-wabdefs-spropproblem">SPropProblem</a> structures in the array indicated by the <b>aProblem</b> member.
     * @type {Integer}
     */
    cProblem {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wabdefs/ns-wabdefs-spropproblem">SPropProblem</a>[MAPI_DIM]</b>
     * 
     * Array of variables of type <a href="https://docs.microsoft.com/windows/desktop/api/wabdefs/ns-wabdefs-spropproblem">SPropProblem</a> that specify information about a property error.
     * @type {Array<SPropProblem>}
     */
    aProblem{
        get {
            if(!this.HasProp("__aProblemProxyArray"))
                this.__aProblemProxyArray := Win32FixedArray(this.ptr + 8, 1, SPropProblem, "")
            return this.__aProblemProxyArray
        }
    }
}
