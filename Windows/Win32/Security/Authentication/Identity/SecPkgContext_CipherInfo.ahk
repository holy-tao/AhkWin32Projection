#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Cipher info structure. This is returned by SECPKG_ATTR_CIPHER_INFO ulAttribute from the QueryContextAttributes (Schannel) function.
 * @see https://learn.microsoft.com/windows/win32/api/schannel/ns-schannel-secpkgcontext_cipherinfo
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgContext_CipherInfo {
    #StructPack 4

    /**
     * The dw version.
     */
    dwVersion : UInt32

    /**
     * The dw protocol.
     */
    dwProtocol : UInt32

    /**
     * The dw cipher suite.
     */
    dwCipherSuite : UInt32

    /**
     * The dw base cipher suite.
     */
    dwBaseCipherSuite : UInt32

    /**
     * The sz cipher suite.
     */
    szCipherSuite : WCHAR[64]

    /**
     * The sz cipher.
     */
    szCipher : WCHAR[64]

    /**
     * The dw cipher length.
     */
    dwCipherLen : UInt32

    /**
     * The dw cipher block length in bytes.
     */
    dwCipherBlockLen : UInt32

    /**
     * The sz hash.
     */
    szHash : WCHAR[64]

    /**
     * The dw hash length.
     */
    dwHashLen : UInt32

    /**
     * The sz exchange.
     */
    szExchange : WCHAR[64]

    /**
     * The dw min exchange length.
     */
    dwMinExchangeLen : UInt32

    /**
     * The dw max exchange length.
     */
    dwMaxExchangeLen : UInt32

    /**
     * The sz certificate.
     */
    szCertificate : WCHAR[64]

    /**
     * The dw key type.
     */
    dwKeyType : UInt32

}
