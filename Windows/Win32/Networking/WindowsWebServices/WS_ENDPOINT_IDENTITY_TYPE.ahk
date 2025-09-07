#Requires AutoHotkey v2.0.0 64-bit

/**
 * The type of the endpoint IDentity, used as a selector for subtypes of WS_ENDPOINT_IDENTITY.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_endpoint_identity_type
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_ENDPOINT_IDENTITY_TYPE{

    /**
     * Type ID for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_dns_endpoint_identity">WS_DNS_ENDPOINT_IDENTITY</a>.
     * @type {Integer (Int32)}
     */
    static WS_DNS_ENDPOINT_IDENTITY_TYPE => 1

    /**
     * Type ID for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_upn_endpoint_identity">WS_UPN_ENDPOINT_IDENTITY</a>.
     * @type {Integer (Int32)}
     */
    static WS_UPN_ENDPOINT_IDENTITY_TYPE => 2

    /**
     * Type ID for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_spn_endpoint_identity">WS_SPN_ENDPOINT_IDENTITY</a>.
     * @type {Integer (Int32)}
     */
    static WS_SPN_ENDPOINT_IDENTITY_TYPE => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_RSA_ENDPOINT_IDENTITY_TYPE => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_CERT_ENDPOINT_IDENTITY_TYPE => 5

    /**
     * Type ID for <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_unknown_endpoint_identity">WS_UNKNOWN_ENDPOINT_IDENTITY</a>.
     * @type {Integer (Int32)}
     */
    static WS_UNKNOWN_ENDPOINT_IDENTITY_TYPE => 6
}
