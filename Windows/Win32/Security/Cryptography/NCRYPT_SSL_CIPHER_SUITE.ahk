#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCRYPT_SSL_CIPHER_SUITE {
    #StructPack 4

    dwProtocol : UInt32

    dwCipherSuite : UInt32

    dwBaseCipherSuite : UInt32

    szCipherSuite : WCHAR[64]

    szCipher : WCHAR[64]

    dwCipherLen : UInt32

    dwCipherBlockLen : UInt32

    szHash : WCHAR[64]

    dwHashLen : UInt32

    szExchange : WCHAR[64]

    dwMinExchangeLen : UInt32

    dwMaxExchangeLen : UInt32

    szCertificate : WCHAR[64]

    dwKeyType : UInt32

}
