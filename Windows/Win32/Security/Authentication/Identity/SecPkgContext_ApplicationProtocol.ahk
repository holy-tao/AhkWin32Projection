#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the application protocol of the security context.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-secpkgcontext_applicationprotocol
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SecPkgContext_ApplicationProtocol extends Win32Struct
{
    static sizeof => 264

    static packingSize => 4

    /**
     * The application protocol negotiation status.
     * @type {Integer}
     */
    ProtoNegoStatus {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The protocol negotiation extension type corresponding to this protocol ID.
     * @type {Integer}
     */
    ProtoNegoExt {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * The size (in bytes) of the application protocol ID.
     * @type {Integer}
     */
    ProtocolIdSize {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * A byte string representing the negotiated application protocol ID.
     * @type {Array<Byte>}
     */
    ProtocolId{
        get {
            if(!this.HasProp("__ProtocolIdProxyArray"))
                this.__ProtocolIdProxyArray := Win32FixedArray(this.ptr + 9, 1, Primitive, "char")
            return this.__ProtocolIdProxyArray
        }
    }
}
