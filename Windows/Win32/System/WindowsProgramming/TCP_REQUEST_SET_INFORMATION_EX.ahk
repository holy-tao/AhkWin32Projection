#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\TDIEntityID.ahk
#Include .\TDIObjectID.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class TCP_REQUEST_SET_INFORMATION_EX extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {TDIObjectID}
     */
    ID{
        get {
            if(!this.HasProp("__ID"))
                this.__ID := TDIObjectID(0, this)
            return this.__ID
        }
    }

    /**
     * @type {Integer}
     */
    BufferSize {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Array<Byte>}
     */
    Buffer{
        get {
            if(!this.HasProp("__BufferProxyArray"))
                this.__BufferProxyArray := Win32FixedArray(this.ptr + 28, 1, Primitive, "char")
            return this.__BufferProxyArray
        }
    }
}
