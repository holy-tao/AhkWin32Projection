#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used with the CryptGetProvParam function when the PP_ENUMALGS_EX parameter is retrieved to contain information about an algorithm supported by a cryptographic service provider (CSP).
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-prov_enumalgs_ex
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class PROV_ENUMALGS_EX extends Win32Struct
{
    static sizeof => 148

    static packingSize => 4

    /**
     * One of the <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/alg-id">ALG_ID</a> values that identifies the algorithm.
     * @type {Integer}
     */
    aiAlgid {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The default <a href="https://docs.microsoft.com/windows/desktop/SecGloss/k-gly">key length</a>, in bits, of the algorithm.
     * @type {Integer}
     */
    dwDefaultLen {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The minimum <a href="https://docs.microsoft.com/windows/desktop/SecGloss/k-gly">key length</a>, in bits, of the algorithm.
     * @type {Integer}
     */
    dwMinLen {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The maximum <a href="https://docs.microsoft.com/windows/desktop/SecGloss/k-gly">key length</a>, in bits, of the algorithm.
     * @type {Integer}
     */
    dwMaxLen {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Zero or a combination of one or more of the <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/protocol-flags">Protocol Flags</a> values that identifies the protocols supported by the algorithm.
     * @type {Integer}
     */
    dwProtocols {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The length, in <b>CHAR</b>s, of the <b>szName</b> string. This length includes the terminating null character.
     * @type {Integer}
     */
    dwNameLen {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * A null-terminated ANSI string that contains the name of the algorithm.
     * @type {String}
     */
    szName {
        get => StrGet(this.ptr + 24, 19, "UTF-16")
        set => StrPut(value, this.ptr + 24, 19, "UTF-16")
    }

    /**
     * The length, in <b>CHAR</b>s, of the <b>szLongName</b> string. This length includes the terminating null character.
     * @type {Integer}
     */
    dwLongNameLen {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * A null-terminated ANSI string that contains the long name of the algorithm.
     * @type {String}
     */
    szLongName {
        get => StrGet(this.ptr + 68, 39, "UTF-16")
        set => StrPut(value, this.ptr + 68, 39, "UTF-16")
    }
}
