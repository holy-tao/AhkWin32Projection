#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_CERT_CREDENTIAL.ahk" { WS_CERT_CREDENTIAL }
#Import ".\WS_STRING.ahk" { WS_STRING }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WS_CERT_CREDENTIAL_TYPE.ahk" { WS_CERT_CREDENTIAL_TYPE }

/**
 * The type for specifying a certificate credential using the certificate's subject name, store location and store name. The specified credential is loaded when the containing channel or listener is opened.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_subject_name_cert_credential
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_SUBJECT_NAME_CERT_CREDENTIAL {
    #StructPack 8

    /**
     * The base type from which this type and all other certificate credential types derive.
     */
    credential : WS_CERT_CREDENTIAL

    /**
     * The certificate store location (such as CERT_SYSTEM_STORE_CURRENT_USER
     * or CERT_SYSTEM_STORE_LOCAL_MACHINE) that contains the specified
     * certificate.
     */
    storeLocation : UInt32

    /**
     * The certificate store name (such as "My") that contains the specified
     * certificate.
     */
    storeName : WS_STRING

    /**
     * The subject name (such as "CN=service.com") of the specified
     * certificate.  The supplied subject name string must be in a format acceptable to
     * CERT_FIND_SUBJECT_NAME-based
     * search.
     *                 (See <a href="https://docs.microsoft.com/windows/win32/api/wincrypt/nf-wincrypt-certfindcertificateinstore">CertFindCertificateInStore</a>.)
     */
    subjectName : WS_STRING

}
