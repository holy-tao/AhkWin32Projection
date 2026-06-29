#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the certificate credentials. The QueryCredentialsAttributes function uses this structure.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-secpkgcredentials_cert
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgCredentials_Cert {
    #StructPack 8

    /**
     * Size of the encoded certificate.
     */
    EncodedCertSize : UInt32

    /**
     * The encoded certificate.
     */
    EncodedCert : IntPtr

}
