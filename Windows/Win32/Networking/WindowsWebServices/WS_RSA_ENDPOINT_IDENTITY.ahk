#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_ENDPOINT_IDENTITY.ahk
#Include .\WS_BYTES.ahk

/**
 * Type for RSA endpoint identity.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_rsa_endpoint_identity
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_RSA_ENDPOINT_IDENTITY extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The base type from which this type and all other endpoint identity types derive.
     * @type {WS_ENDPOINT_IDENTITY}
     */
    identity{
        get {
            if(!this.HasProp("__identity"))
                this.__identity := WS_ENDPOINT_IDENTITY(this.ptr + 0)
            return this.__identity
        }
    }

    /**
     * The RSA key modulus of the endpoint that is represented by this endpoint identity.
     * @type {WS_BYTES}
     */
    modulus{
        get {
            if(!this.HasProp("__modulus"))
                this.__modulus := WS_BYTES(this.ptr + 8)
            return this.__modulus
        }
    }

    /**
     * The RSA key exponent of the endpoint that is represented by this endpoint identity.
     * @type {WS_BYTES}
     */
    exponent{
        get {
            if(!this.HasProp("__exponent"))
                this.__exponent := WS_BYTES(this.ptr + 24)
            return this.__exponent
        }
    }
}
