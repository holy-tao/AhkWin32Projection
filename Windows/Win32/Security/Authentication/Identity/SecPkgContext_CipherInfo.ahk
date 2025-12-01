#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Cipher info structure. This is returned by SECPKG_ATTR_CIPHER_INFO ulAttribute from the QueryContextAttributes (Schannel) function.
 * @see https://learn.microsoft.com/windows/win32/api/schannel/ns-schannel-secpkgcontext_cipherinfo
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SecPkgContext_CipherInfo extends Win32Struct
{
    static sizeof => 680

    static packingSize => 4

    /**
     * The dw version.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The dw protocol.
     * @type {Integer}
     */
    dwProtocol {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The dw cipher suite.
     * @type {Integer}
     */
    dwCipherSuite {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The dw base cipher suite.
     * @type {Integer}
     */
    dwBaseCipherSuite {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The sz cipher suite.
     * @type {String}
     */
    szCipherSuite {
        get => StrGet(this.ptr + 16, 63, "UTF-16")
        set => StrPut(value, this.ptr + 16, 63, "UTF-16")
    }

    /**
     * The sz cipher.
     * @type {String}
     */
    szCipher {
        get => StrGet(this.ptr + 144, 63, "UTF-16")
        set => StrPut(value, this.ptr + 144, 63, "UTF-16")
    }

    /**
     * The dw cipher length.
     * @type {Integer}
     */
    dwCipherLen {
        get => NumGet(this, 272, "uint")
        set => NumPut("uint", value, this, 272)
    }

    /**
     * The dw cipher block length in bytes.
     * @type {Integer}
     */
    dwCipherBlockLen {
        get => NumGet(this, 276, "uint")
        set => NumPut("uint", value, this, 276)
    }

    /**
     * The sz hash.
     * @type {String}
     */
    szHash {
        get => StrGet(this.ptr + 280, 63, "UTF-16")
        set => StrPut(value, this.ptr + 280, 63, "UTF-16")
    }

    /**
     * The dw hash length.
     * @type {Integer}
     */
    dwHashLen {
        get => NumGet(this, 408, "uint")
        set => NumPut("uint", value, this, 408)
    }

    /**
     * The sz exchange.
     * @type {String}
     */
    szExchange {
        get => StrGet(this.ptr + 412, 63, "UTF-16")
        set => StrPut(value, this.ptr + 412, 63, "UTF-16")
    }

    /**
     * The dw min exchange length.
     * @type {Integer}
     */
    dwMinExchangeLen {
        get => NumGet(this, 540, "uint")
        set => NumPut("uint", value, this, 540)
    }

    /**
     * The dw max exchange length.
     * @type {Integer}
     */
    dwMaxExchangeLen {
        get => NumGet(this, 544, "uint")
        set => NumPut("uint", value, this, 544)
    }

    /**
     * The sz certificate.
     * @type {String}
     */
    szCertificate {
        get => StrGet(this.ptr + 548, 63, "UTF-16")
        set => StrPut(value, this.ptr + 548, 63, "UTF-16")
    }

    /**
     * The dw key type.
     * @type {Integer}
     */
    dwKeyType {
        get => NumGet(this, 676, "uint")
        set => NumPut("uint", value, this, 676)
    }
}
