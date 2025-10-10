#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class MAPIUID extends Win32Struct
{
    static sizeof => 16

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    ab{
        get {
            if(!this.HasProp("__abProxyArray"))
                this.__abProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "char")
            return this.__abProxyArray
        }
    }
}
