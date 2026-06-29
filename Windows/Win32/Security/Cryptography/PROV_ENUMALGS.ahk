#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ALG_ID.ahk" { ALG_ID }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Used with the CryptGetProvParam function when the PP_ENUMALGS parameter is retrieved to contain information about an algorithm supported by a cryptographic service provider (CSP).
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-prov_enumalgs
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PROV_ENUMALGS {
    #StructPack 4

    /**
     * One of the <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/alg-id">ALG_ID</a> values that identifies the algorithm.
     */
    aiAlgid : ALG_ID

    /**
     * The default <a href="https://docs.microsoft.com/windows/desktop/SecGloss/k-gly">key length</a>, in bits, of the algorithm.
     */
    dwBitLen : UInt32

    /**
     * The length, in <b>CHAR</b>s, of the <b>szName</b> string. This length includes the terminating null character.
     */
    dwNameLen : UInt32

    /**
     * A null-terminated ANSI string that contains the name of the algorithm.
     */
    szName : CHAR[20]

}
