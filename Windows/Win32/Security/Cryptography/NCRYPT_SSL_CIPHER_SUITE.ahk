#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class NCRYPT_SSL_CIPHER_SUITE extends Win32Struct
{
    static sizeof => 676

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwProtocol {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwCipherSuite {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dwBaseCipherSuite {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {String}
     */
    szCipherSuite {
        get => StrGet(this.ptr + 12, 63, "UTF-16")
        set => StrPut(value, this.ptr + 12, 63, "UTF-16")
    }

    /**
     * @type {String}
     */
    szCipher {
        get => StrGet(this.ptr + 140, 63, "UTF-16")
        set => StrPut(value, this.ptr + 140, 63, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwCipherLen {
        get => NumGet(this, 268, "uint")
        set => NumPut("uint", value, this, 268)
    }

    /**
     * @type {Integer}
     */
    dwCipherBlockLen {
        get => NumGet(this, 272, "uint")
        set => NumPut("uint", value, this, 272)
    }

    /**
     * @type {String}
     */
    szHash {
        get => StrGet(this.ptr + 276, 63, "UTF-16")
        set => StrPut(value, this.ptr + 276, 63, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwHashLen {
        get => NumGet(this, 404, "uint")
        set => NumPut("uint", value, this, 404)
    }

    /**
     * @type {String}
     */
    szExchange {
        get => StrGet(this.ptr + 408, 63, "UTF-16")
        set => StrPut(value, this.ptr + 408, 63, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwMinExchangeLen {
        get => NumGet(this, 536, "uint")
        set => NumPut("uint", value, this, 536)
    }

    /**
     * @type {Integer}
     */
    dwMaxExchangeLen {
        get => NumGet(this, 540, "uint")
        set => NumPut("uint", value, this, 540)
    }

    /**
     * @type {String}
     */
    szCertificate {
        get => StrGet(this.ptr + 544, 63, "UTF-16")
        set => StrPut(value, this.ptr + 544, 63, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwKeyType {
        get => NumGet(this, 672, "uint")
        set => NumPut("uint", value, this, 672)
    }
}
