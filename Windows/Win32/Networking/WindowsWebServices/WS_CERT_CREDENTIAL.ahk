#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_CERT_CREDENTIAL_TYPE.ahk" { WS_CERT_CREDENTIAL_TYPE }

/**
 * The abstract base type for all certificate credential types.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_cert_credential
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_CERT_CREDENTIAL {
    #StructPack 4

    /**
     * The type ID that indicates which of the certificate credential
     * subtypes this certificate credential is.
     */
    credentialType : WS_CERT_CREDENTIAL_TYPE

}
