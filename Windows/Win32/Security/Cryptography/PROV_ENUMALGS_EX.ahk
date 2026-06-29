#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ALG_ID.ahk" { ALG_ID }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Used with the CryptGetProvParam function when the PP_ENUMALGS_EX parameter is retrieved to contain information about an algorithm supported by a cryptographic service provider (CSP).
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-prov_enumalgs_ex
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PROV_ENUMALGS_EX {
    #StructPack 4

    /**
     * One of the <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/alg-id">ALG_ID</a> values that identifies the algorithm.
     */
    aiAlgid : ALG_ID

    /**
     * The default <a href="https://docs.microsoft.com/windows/desktop/SecGloss/k-gly">key length</a>, in bits, of the algorithm.
     */
    dwDefaultLen : UInt32

    /**
     * The minimum <a href="https://docs.microsoft.com/windows/desktop/SecGloss/k-gly">key length</a>, in bits, of the algorithm.
     */
    dwMinLen : UInt32

    /**
     * The maximum <a href="https://docs.microsoft.com/windows/desktop/SecGloss/k-gly">key length</a>, in bits, of the algorithm.
     */
    dwMaxLen : UInt32

    /**
     * Zero or a combination of one or more of the <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/protocol-flags">Protocol Flags</a> values that identifies the protocols supported by the algorithm.
     */
    dwProtocols : UInt32

    /**
     * The length, in <b>CHAR</b>s, of the <b>szName</b> string. This length includes the terminating null character.
     */
    dwNameLen : UInt32

    /**
     * A null-terminated ANSI string that contains the name of the algorithm.
     */
    szName : CHAR[20]

    /**
     * The length, in <b>CHAR</b>s, of the <b>szLongName</b> string. This length includes the terminating null character.
     */
    dwLongNameLen : UInt32

    /**
     * A null-terminated ANSI string that contains the long name of the algorithm.
     */
    szLongName : CHAR[40]

}
