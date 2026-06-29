#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Stores client information for an inbound request that was sent with a client certificate.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/ns-wsman-wsman_certificate_details
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct WSMAN_CERTIFICATE_DETAILS {
    #StructPack 8

    /**
     * Specifies the subject that is identified by the certificate.
     */
    subject : PWSTR

    /**
     * Specifies the name of the issuer of the certificate.
     */
    issuerName : PWSTR

    /**
     * Specifies the thumbprint of the issuer.
     */
    issuerThumbprint : PWSTR

    /**
     * Specifies the subject name of the issuer.
     */
    subjectName : PWSTR

}
