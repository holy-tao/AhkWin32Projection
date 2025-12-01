#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_ENDPOINT_IDENTITY.ahk
#Include .\WS_STRING.ahk

/**
 * Type for specifying an endpoint identity represented by a UPN (user principal name).
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_upn_endpoint_identity
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_UPN_ENDPOINT_IDENTITY extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The base type from which this type and all other endpoint identity types derive.
     * @type {WS_ENDPOINT_IDENTITY}
     */
    identity{
        get {
            if(!this.HasProp("__identity"))
                this.__identity := WS_ENDPOINT_IDENTITY(0, this)
            return this.__identity
        }
    }

    /**
     * The UPN (user principal name) of the endpoint that is represented by this endpoint identity.
     * @type {WS_STRING}
     */
    upn{
        get {
            if(!this.HasProp("__upn"))
                this.__upn := WS_STRING(8, this)
            return this.__upn
        }
    }
}
