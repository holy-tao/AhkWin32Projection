#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The type IDs of the SAML token authenticators used on the server side (For example, relying party) to validate incoming SAML tokens.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_saml_authenticator_type
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_SAML_AUTHENTICATOR_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Type ID for the SAML authenticator <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_cert_signed_saml_authenticator">WS_CERT_SIGNED_SAML_AUTHENTICATOR</a>.
     * @type {Integer (Int32)}
     */
    static WS_CERT_SIGNED_SAML_AUTHENTICATOR_TYPE => 1
}
