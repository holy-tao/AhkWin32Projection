#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_ENDPOINT_IDENTITY.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\WS_STRING.ahk

/**
 * Type for specifying an endpoint identity represented by an SPN (service principal name).
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_spn_endpoint_identity
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_SPN_ENDPOINT_IDENTITY extends Win32Struct
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
                this.__identity := WS_ENDPOINT_IDENTITY(this.ptr + 0)
            return this.__identity
        }
    }

    /**
     * The SPN (service principal name) of the endpoint that is represented by this endpoint identity.
     * @type {WS_STRING}
     */
    spn{
        get {
            if(!this.HasProp("__spn"))
                this.__spn := WS_STRING(this.ptr + 8)
            return this.__spn
        }
    }
}
