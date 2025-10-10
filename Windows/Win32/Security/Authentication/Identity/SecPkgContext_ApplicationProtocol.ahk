#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SecPkgContext_ApplicationProtocol extends Win32Struct
{
    static sizeof => 264

    static packingSize => 4

    /**
     * @type {Integer}
     */
    ProtoNegoStatus {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ProtoNegoExt {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    ProtocolIdSize {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {Array<Byte>}
     */
    ProtocolId{
        get {
            if(!this.HasProp("__ProtocolIdProxyArray"))
                this.__ProtocolIdProxyArray := Win32FixedArray(this.ptr + 9, 255, Primitive, "char")
            return this.__ProtocolIdProxyArray
        }
    }
}
