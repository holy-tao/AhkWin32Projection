#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_CERT_CREDENTIAL.ahk" { WS_CERT_CREDENTIAL }
#Import ".\WS_CERT_CREDENTIAL_TYPE.ahk" { WS_CERT_CREDENTIAL_TYPE }

/**
 * The type for specifying a certificate credential that is to be supplied by a callback to the application.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_custom_cert_credential
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_CUSTOM_CERT_CREDENTIAL {
    #StructPack 8

    /**
     * The base type from which this type and all other certificate credential types derive.
     */
    credential : WS_CERT_CREDENTIAL

    /**
     * The Callback to get the certificate.
     */
    getCertCallback : IntPtr

    /**
     * The state to be passed when invoking the callback.
     */
    getCertCallbackState : IntPtr

    certIssuerListNotificationCallback : IntPtr

    certIssuerListNotificationCallbackState : IntPtr

}
