#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class DL_EI48 extends Win32Struct
{
    static sizeof => 3

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    Byte{
        get {
            if(!this.HasProp("__ByteProxyArray"))
                this.__ByteProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__ByteProxyArray
        }
    }
}
