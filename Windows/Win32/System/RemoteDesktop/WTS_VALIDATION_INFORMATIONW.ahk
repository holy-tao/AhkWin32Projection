#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PRODUCT_INFOW.ahk

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 * @charset Unicode
 */
class WTS_VALIDATION_INFORMATIONW extends Win32Struct
{
    static sizeof => 16936

    static packingSize => 8

    /**
     * @type {PRODUCT_INFOW}
     */
    ProductInfo{
        get {
            if(!this.HasProp("__ProductInfo"))
                this.__ProductInfo := PRODUCT_INFOW(this.ptr + 0)
            return this.__ProductInfo
        }
    }

    /**
     * @type {Array<Byte>}
     */
    License{
        get {
            if(!this.HasProp("__LicenseProxyArray"))
                this.__LicenseProxyArray := Win32FixedArray(this.ptr + 520, 16384, Primitive, "char")
            return this.__LicenseProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    LicenseLength {
        get => NumGet(this, 16904, "uint")
        set => NumPut("uint", value, this, 16904)
    }

    /**
     * @type {Array<Byte>}
     */
    HardwareID{
        get {
            if(!this.HasProp("__HardwareIDProxyArray"))
                this.__HardwareIDProxyArray := Win32FixedArray(this.ptr + 16908, 20, Primitive, "char")
            return this.__HardwareIDProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    HardwareIDLength {
        get => NumGet(this, 16928, "uint")
        set => NumPut("uint", value, this, 16928)
    }
}
