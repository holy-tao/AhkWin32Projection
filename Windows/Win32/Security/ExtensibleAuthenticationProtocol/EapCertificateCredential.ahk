#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains information about the certificate that the EAP method uses for authentication.
 * @see https://learn.microsoft.com/windows/win32/api/eaptypes/ns-eaptypes-eapcertificatecredential
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
export default struct EapCertificateCredential {
    #StructPack 8

    /**
     * SHA1 hash of the certificate.
     */
    certHash : Int8[20]

    /**
     * If the certificate is present on the system and strong private key protection is turned on for this certificate, this field contains the password to access the certificate.
     */
    password : PWSTR

}
