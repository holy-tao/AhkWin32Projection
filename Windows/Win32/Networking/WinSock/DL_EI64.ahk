#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
class DL_EI64 extends Win32Struct {
    static sizeof => 5

    static packingSize => 1

    /**
     * @type {Array<Integer>}
     */
    Byte {
        get {
            if(!this.HasProp("__ByteProxyArray"))
                this.__ByteProxyArray := Win32FixedArray(this.ptr + 0, 5, Primitive, "char")
            return this.__ByteProxyArray
        }
    }
}
