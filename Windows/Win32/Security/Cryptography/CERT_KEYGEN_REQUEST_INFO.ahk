#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CERT_PUBLIC_KEY_INFO.ahk" { CERT_PUBLIC_KEY_INFO }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }
#Import ".\CRYPT_BIT_BLOB.ahk" { CRYPT_BIT_BLOB }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains information stored in the Netscape key generation request. The subject and subject public key BLOBs are encoded.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_keygen_request_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_KEYGEN_REQUEST_INFO {
    #StructPack 8

    /**
     * The version number of the certificate. <b>CERT_KEYGEN_REQUEST_V1</b> (0) is the only defined version number.
     */
    dwVersion : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_public_key_info">CERT_PUBLIC_KEY_INFO</a> structure that contains the encoded <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">public key</a> and <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">public key algorithm</a>.
     */
    SubjectPublicKeyInfo : CERT_PUBLIC_KEY_INFO

    /**
     * A random printable string. This string is used by the server to ensure that the key that it is certifying matches the client on the page.
     */
    pwszChallengeString : PWSTR

}
