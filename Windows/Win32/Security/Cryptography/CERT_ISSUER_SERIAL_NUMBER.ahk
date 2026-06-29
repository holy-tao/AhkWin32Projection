#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }

/**
 * Acts as a unique identifier of a certificate containing the issuer and issuer's serial number for a certificate.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_issuer_serial_number
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_ISSUER_SERIAL_NUMBER {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">BLOB</a> structure that contains the name of the issuer.
     */
    Issuer : CRYPT_INTEGER_BLOB

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a> structure that contains the serial number of the certificate. The combination of the issuer name and the serial number is a unique identifier of a certificate.
     */
    SerialNumber : CRYPT_INTEGER_BLOB

}
