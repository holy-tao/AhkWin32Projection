#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_ENDPOINT_IDENTITY.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\WS_STRING.ahk

/**
 * Type for specifying an endpoint identity represented by a DNS name.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_dns_endpoint_identity
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_DNS_ENDPOINT_IDENTITY extends Win32Struct
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
     * The DNS name of the endpoint that is represented by this endpoint identity.
     *                     The acceptable forms of the name are as defined by <a href="http://tools.ietf.org/html/rfc1035">RFC 1035</a>.
     *                     In particular, they include both a simple machine name as well as a fully qualified domain name (FQDN).
     * @type {WS_STRING}
     */
    dns{
        get {
            if(!this.HasProp("__dns"))
                this.__dns := WS_STRING(this.ptr + 8)
            return this.__dns
        }
    }
}
