#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include .\SID.ahk
#Include .\SID_IDENTIFIER_AUTHORITY.ahk

/**
 * @namespace Windows.Win32.Security
 */
class SE_SID extends Win32Struct {
    static sizeof => 80

    static packingSize => 4

    /**
     * @type {SID}
     */
    Sid {
        get {
            if(!this.HasProp("__Sid"))
                this.__Sid := SID(0, this)
            return this.__Sid
        }
    }

    /**
     * @type {Array<Integer>}
     */
    Buffer {
        get {
            if(!this.HasProp("__BufferProxyArray"))
                this.__BufferProxyArray := Win32FixedArray(this.ptr + 0, 68, Primitive, "char")
            return this.__BufferProxyArray
        }
    }
}
