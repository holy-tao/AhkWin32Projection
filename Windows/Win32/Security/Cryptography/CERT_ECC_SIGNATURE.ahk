#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }

/**
 * Contains the r and s values for an Elliptic Curve Digital Signature Algorithm (ECDSA) signature.
 * @remarks
 * Before encoding, a leading zero byte will be inserted for the <b>r</b> and <b>s</b> members. After decoding, a leading zero byte will be removed from the <b>r</b> and <b>s</b> members if the leading zero is present.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_ecc_signature
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_ECC_SIGNATURE {
    #StructPack 8

    /**
     * The r value of the ECDSA signature. This value is in <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">little-endian</a> order.
     */
    r : CRYPT_INTEGER_BLOB

    /**
     * The s value of the ECDSA signature. This value is in little-endian order.
     */
    s : CRYPT_INTEGER_BLOB

}
