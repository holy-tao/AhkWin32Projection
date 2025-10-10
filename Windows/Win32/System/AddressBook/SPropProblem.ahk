#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Do not use. Describes an error relating to an operation involving a property.
 * @see https://docs.microsoft.com/windows/win32/api//wabdefs/ns-wabdefs-spropproblem
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class SPropProblem extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Type: <b>ULONG</b>
     * 
     * Variable of type <b>ULONG</b> that specifies the index value in an array of property tags.
     * @type {Integer}
     */
    ulIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * Variable of type <b>ULONG</b> that specifies the property tag for the property with the error.
     * @type {Integer}
     */
    ulPropTag {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>SCODE</b>
     * 
     * Variable of type <b>SCODE</b> that specifies the error value that describes the problem with the property.
     * @type {Integer}
     */
    scode {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
