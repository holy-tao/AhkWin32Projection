#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class NCRYPT_SSL_ECC_CURVE extends Win32Struct
{
    static sizeof => 1032

    static packingSize => 4

    /**
     * @type {String}
     */
    szCurveName {
        get => StrGet(this.ptr + 0, 254, "UTF-16")
        set => StrPut(value, this.ptr + 0, 254, "UTF-16")
    }

    /**
     * @type {String}
     */
    szOID {
        get => StrGet(this.ptr + 510, 254, "UTF-16")
        set => StrPut(value, this.ptr + 510, 254, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwPublicKeyLength {
        get => NumGet(this, 1020, "uint")
        set => NumPut("uint", value, this, 1020)
    }

    /**
     * @type {Integer}
     */
    dwCurveType {
        get => NumGet(this, 1024, "uint")
        set => NumPut("uint", value, this, 1024)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 1028, "uint")
        set => NumPut("uint", value, this, 1028)
    }
}
