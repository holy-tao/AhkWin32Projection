#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }

/**
 * Contains parameters associated with a Diffie/Hellman public key algorithm.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_dh_parameters
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_DH_PARAMETERS {
    #StructPack 8

    /**
     * Prime modulus P. The most significant bit of the most significant byte must always be set to 1.
     */
    p : CRYPT_INTEGER_BLOB

    /**
     * Generator G. Must be the same length as <b>p</b> (must be padded with 0x00 bytes if it is less).
     */
    g : CRYPT_INTEGER_BLOB

}
