#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class NCRYPT_SSL_CIPHER_SUITE_EX extends Win32Struct
{
    static sizeof => 808

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwProtocol {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dwCipherSuite {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwBaseCipherSuite {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {String}
     */
    szCipherSuite {
        get => StrGet(this.ptr + 16, 63, "UTF-16")
        set => StrPut(value, this.ptr + 16, 63, "UTF-16")
    }

    /**
     * @type {String}
     */
    szCipher {
        get => StrGet(this.ptr + 144, 63, "UTF-16")
        set => StrPut(value, this.ptr + 144, 63, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwCipherLen {
        get => NumGet(this, 272, "uint")
        set => NumPut("uint", value, this, 272)
    }

    /**
     * @type {Integer}
     */
    dwCipherBlockLen {
        get => NumGet(this, 276, "uint")
        set => NumPut("uint", value, this, 276)
    }

    /**
     * @type {String}
     */
    szHash {
        get => StrGet(this.ptr + 280, 63, "UTF-16")
        set => StrPut(value, this.ptr + 280, 63, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwHashLen {
        get => NumGet(this, 408, "uint")
        set => NumPut("uint", value, this, 408)
    }

    /**
     * @type {String}
     */
    szExchange {
        get => StrGet(this.ptr + 412, 63, "UTF-16")
        set => StrPut(value, this.ptr + 412, 63, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwMinExchangeLen {
        get => NumGet(this, 540, "uint")
        set => NumPut("uint", value, this, 540)
    }

    /**
     * @type {Integer}
     */
    dwMaxExchangeLen {
        get => NumGet(this, 544, "uint")
        set => NumPut("uint", value, this, 544)
    }

    /**
     * @type {String}
     */
    szCertificate {
        get => StrGet(this.ptr + 548, 63, "UTF-16")
        set => StrPut(value, this.ptr + 548, 63, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwKeyType {
        get => NumGet(this, 676, "uint")
        set => NumPut("uint", value, this, 676)
    }

    /**
     * @type {String}
     */
    szCipherMode {
        get => StrGet(this.ptr + 680, 63, "UTF-16")
        set => StrPut(value, this.ptr + 680, 63, "UTF-16")
    }
}
