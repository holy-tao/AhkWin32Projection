#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The CERT_CREDENTIAL_INFO structure contains a reference to a certificate.
 * @remarks
 * <b>CERT_HASH_LENGTH</b> is defined as 20 in WinCred.h.
 * @see https://learn.microsoft.com/windows/win32/api/wincred/ns-wincred-cert_credential_info
 * @namespace Windows.Win32.Security.Credentials
 */
export default struct CERT_CREDENTIAL_INFO {
    #StructPack 4

    /**
     * Size of the structure in bytes. This member should be set to 
     *       <c>sizeof(CERT_CREDENTIAL_INFO)</c>. This structure might be a larger value in 
     *       the future, indicating a newer version of the structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * SHA-1 hash of the certificate referenced.
     */
    rgbHashOfCert : Int8[20]

}
