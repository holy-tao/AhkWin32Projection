#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_SAML_AUTHENTICATOR_TYPE.ahk" { WS_SAML_AUTHENTICATOR_TYPE }

/**
 * The abstract base type for all SAML authenticators used on the server side to validate incoming SAML tokens.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_saml_authenticator
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_SAML_AUTHENTICATOR {
    #StructPack 4

    /**
     * The type id that indicates the SAML authenticator subtype of this authenticator.
     */
    authenticatorType : WS_SAML_AUTHENTICATOR_TYPE

}
