#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }

/**
 * The CERT_PAIR structure contains a certificate and its pair cross certificate.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_pair
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_PAIR {
    #StructPack 8

    /**
     * An optional <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CERT_BLOB</a> structure that contains a certificate. If the <b>cbData</b> member of <b>Forward</b> is zero, the certificate may be empty.
     */
    Forward : CRYPT_INTEGER_BLOB

    /**
     * An optional <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CERT_BLOB</a> structure that contains a certificate. If the <b>cbData</b> member of <b>Reverse</b> is zero, the certificate may be empty.
     */
    Reverse : CRYPT_INTEGER_BLOB

}
