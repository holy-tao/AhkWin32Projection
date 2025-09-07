#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PRODUCT_INFOA.ahk

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 * @charset ANSI
 */
class WTS_VALIDATION_INFORMATIONA extends Win32Struct
{
    static sizeof => 16672

    static packingSize => 8

    /**
     * @type {PRODUCT_INFOA}
     */
    ProductInfo{
        get {
            if(!this.HasProp("__ProductInfo"))
                this.__ProductInfo := PRODUCT_INFOA(this.ptr + 0)
            return this.__ProductInfo
        }
    }

    /**
     * @type {Array<Byte>}
     */
    License{
        get {
            if(!this.HasProp("__LicenseProxyArray"))
                this.__LicenseProxyArray := Win32FixedArray(this.ptr + 260, 1, Primitive, "char")
            return this.__LicenseProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    LicenseLength {
        get => NumGet(this, 16644, "uint")
        set => NumPut("uint", value, this, 16644)
    }

    /**
     * @type {Array<Byte>}
     */
    HardwareID{
        get {
            if(!this.HasProp("__HardwareIDProxyArray"))
                this.__HardwareIDProxyArray := Win32FixedArray(this.ptr + 16648, 1, Primitive, "char")
            return this.__HardwareIDProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    HardwareIDLength {
        get => NumGet(this, 16668, "uint")
        set => NumPut("uint", value, this, 16668)
    }
}
