#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Do not use. Contains an array of property tags.
 * @see https://docs.microsoft.com/windows/win32/api//wabdefs/ns-wabdefs-sproptagarray
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class SPropTagArray extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b>ULONG</b>
     * 
     * Variable of type <b>ULONG</b> that specifies the number of property tags in the array indicated by the <b>aulPropTag</b> member.
     * @type {Integer}
     */
    cValues {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>ULONG[MAPI_DIM]</b>
     * 
     * Array of variables of type <b>ULONG</b> that specify the property tags.
     * @type {Array<UInt32>}
     */
    aulPropTag{
        get {
            if(!this.HasProp("__aulPropTagProxyArray"))
                this.__aulPropTagProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "uint")
            return this.__aulPropTagProxyArray
        }
    }
}
