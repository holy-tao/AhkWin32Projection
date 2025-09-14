#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class NCRYPT_SSL_ECC_CURVE extends Win32Struct
{
    static sizeof => 780

    static packingSize => 4

    /**
     * @type {String}
     */
    szCurveName {
        get => StrGet(this.ptr + 0, 254, "UTF-16")
        set => StrPut(value, this.ptr + 0, 254, "UTF-16")
    }

    /**
     * @type {Array<SByte>}
     */
    szOID{
        get {
            if(!this.HasProp("__szOIDProxyArray"))
                this.__szOIDProxyArray := Win32FixedArray(this.ptr + 510, 255, Primitive, "char")
            return this.__szOIDProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    dwPublicKeyLength {
        get => NumGet(this, 768, "uint")
        set => NumPut("uint", value, this, 768)
    }

    /**
     * @type {Integer}
     */
    dwCurveType {
        get => NumGet(this, 772, "uint")
        set => NumPut("uint", value, this, 772)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 776, "uint")
        set => NumPut("uint", value, this, 776)
    }
}
