#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\SEC_APPLICATION_PROTOCOL_NEGOTIATION_STATUS.ahk
#Include .\SEC_APPLICATION_PROTOCOL_NEGOTIATION_EXT.ahk

/**
 * Contains information about the application protocol of the security context.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-secpkgcontext_applicationprotocol
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class SecPkgContext_ApplicationProtocol extends Win32Struct {
    static sizeof => 264

    static packingSize => 4

    /**
     * The application protocol negotiation status.
     * @type {SEC_APPLICATION_PROTOCOL_NEGOTIATION_STATUS}
     */
    ProtoNegoStatus {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The protocol negotiation extension type corresponding to this protocol ID.
     * @type {SEC_APPLICATION_PROTOCOL_NEGOTIATION_EXT}
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
     * @type {Array<Integer>}
     */
    ProtocolId {
        get {
            if(!this.HasProp("__ProtocolIdProxyArray"))
                this.__ProtocolIdProxyArray := Win32FixedArray(this.ptr + 9, 255, Primitive, "char")
            return this.__ProtocolIdProxyArray
        }
    }
}
