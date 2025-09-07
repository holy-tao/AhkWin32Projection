#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include .\SID_IDENTIFIER_AUTHORITY.ahk
#Include .\SID.ahk

/**
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class SE_SID extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * @type {SID}
     */
    Sid{
        get {
            if(!this.HasProp("__Sid"))
                this.__Sid := SID(this.ptr + 0)
            return this.__Sid
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Buffer{
        get {
            if(!this.HasProp("__BufferProxyArray"))
                this.__BufferProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__BufferProxyArray
        }
    }
}
