#Requires AutoHotkey v2.0.0 64-bit

/**
 * The type IDs of the SAML token authenticators used on the server side (For example, relying party) to validate incoming SAML tokens.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ne-webservices-ws_saml_authenticator_type
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_SAML_AUTHENTICATOR_TYPE{

    /**
     * Type ID for the SAML authenticator <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_cert_signed_saml_authenticator">WS_CERT_SIGNED_SAML_AUTHENTICATOR</a>.
     * @type {Integer (Int32)}
     */
    static WS_CERT_SIGNED_SAML_AUTHENTICATOR_TYPE => 1
}
