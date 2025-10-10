#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Do not use. Contains the entry identifier information for a MAPI object.
 * @see https://docs.microsoft.com/windows/win32/api//wabdefs/ns-wabdefs-entryid
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class ENTRYID extends Win32Struct
{
    static sizeof => 5

    static packingSize => 1

    /**
     * Type: <b>BYTE[4]</b>
     * 
     * Array of variables of type <b>BYTE</b> that specifies the bitmask of flags that provide information describing the object.
     * @type {Array<Byte>}
     */
    abFlags{
        get {
            if(!this.HasProp("__abFlagsProxyArray"))
                this.__abFlagsProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "char")
            return this.__abFlagsProxyArray
        }
    }

    /**
     * Type: <b>BYTE[MAPI_DIM]</b>
     * 
     * Array of variables of type <b>BYTE</b> that specifies the binary data used by service providers. Client applications cannot use this array.
     * @type {Array<Byte>}
     */
    ab{
        get {
            if(!this.HasProp("__abProxyArray"))
                this.__abProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__abProxyArray
        }
    }
}
