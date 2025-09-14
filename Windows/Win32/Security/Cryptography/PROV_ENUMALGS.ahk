#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used with the CryptGetProvParam function when the PP_ENUMALGS parameter is retrieved to contain information about an algorithm supported by a cryptographic service provider (CSP).
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-prov_enumalgs
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class PROV_ENUMALGS extends Win32Struct
{
    static sizeof => 32

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
    dwBitLen {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The length, in <b>CHAR</b>s, of the <b>szName</b> string. This length includes the terminating null character.
     * @type {Integer}
     */
    dwNameLen {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A null-terminated ANSI string that contains the name of the algorithm.
     * @type {Array<SByte>}
     */
    szName{
        get {
            if(!this.HasProp("__szNameProxyArray"))
                this.__szNameProxyArray := Win32FixedArray(this.ptr + 12, 20, Primitive, "char")
            return this.__szNameProxyArray
        }
    }
}
