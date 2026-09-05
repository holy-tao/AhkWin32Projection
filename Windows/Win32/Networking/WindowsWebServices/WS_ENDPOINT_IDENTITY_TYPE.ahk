#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The type of the endpoint IDentity, used as a selector for subtypes of WS_ENDPOINT_IDENTITY.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_endpoint_identity_type
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
class WS_ENDPOINT_IDENTITY_TYPE extends Win32Enum {

    /**
     * Type ID for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_dns_endpoint_identity">WS_DNS_ENDPOINT_IDENTITY</a>.
     * Native name: WS_DNS_ENDPOINT_IDENTITY_TYPE
     * @type {Integer (Int32)}
     */
    static DNS_ENDPOINT_IDENTITY_TYPE => 1

    /**
     * Type ID for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_upn_endpoint_identity">WS_UPN_ENDPOINT_IDENTITY</a>.
     * Native name: WS_UPN_ENDPOINT_IDENTITY_TYPE
     * @type {Integer (Int32)}
     */
    static UPN_ENDPOINT_IDENTITY_TYPE => 2

    /**
     * Type ID for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_spn_endpoint_identity">WS_SPN_ENDPOINT_IDENTITY</a>.
     * Native name: WS_SPN_ENDPOINT_IDENTITY_TYPE
     * @type {Integer (Int32)}
     */
    static SPN_ENDPOINT_IDENTITY_TYPE => 3

    /**
     * Native name: WS_RSA_ENDPOINT_IDENTITY_TYPE
     * @type {Integer (Int32)}
     */
    static RSA_ENDPOINT_IDENTITY_TYPE => 4

    /**
     * Native name: WS_CERT_ENDPOINT_IDENTITY_TYPE
     * @type {Integer (Int32)}
     */
    static CERT_ENDPOINT_IDENTITY_TYPE => 5

    /**
     * Type ID for <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_unknown_endpoint_identity">WS_UNKNOWN_ENDPOINT_IDENTITY</a>.
     * Native name: WS_UNKNOWN_ENDPOINT_IDENTITY_TYPE
     * @type {Integer (Int32)}
     */
    static UNKNOWN_ENDPOINT_IDENTITY_TYPE => 6
}
