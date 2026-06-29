#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies PKU2U certificate data.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-pku2u_cert_blob
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PKU2U_CERT_BLOB {
    #StructPack 4

    /**
     * The number of bytes from the beginning of this structure in memory to the beginning of the certificate data.
     */
    CertOffset : UInt32

    /**
     * The size, in bytes, of the certificate data.
     */
    CertLength : UInt16

}
