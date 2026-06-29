#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_STRING.ahk" { WS_STRING }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WS_ENDPOINT_IDENTITY_TYPE.ahk" { WS_ENDPOINT_IDENTITY_TYPE }
#Import ".\WS_ENDPOINT_IDENTITY.ahk" { WS_ENDPOINT_IDENTITY }

/**
 * Type for specifying an endpoint identity represented by a DNS name.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_dns_endpoint_identity
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_DNS_ENDPOINT_IDENTITY {
    #StructPack 8

    /**
     * The base type from which this type and all other endpoint identity types derive.
     */
    identity : WS_ENDPOINT_IDENTITY

    /**
     * The DNS name of the endpoint that is represented by this endpoint identity.
     *                     The acceptable forms of the name are as defined by <a href="https://datatracker.ietf.org/doc/html/rfc1035">RFC 1035</a>.
     *                     In particular, they include both a simple machine name as well as a fully qualified domain name (FQDN).
     */
    dns : WS_STRING

}
