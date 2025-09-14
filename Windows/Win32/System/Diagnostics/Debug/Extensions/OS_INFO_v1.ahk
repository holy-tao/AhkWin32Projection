#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class OS_INFO_v1 extends Win32Struct
{
    static sizeof => 192

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Major {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Minor {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    Ver64 {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ProductType {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Suite {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    s {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    SrvPackNumber {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Array<SByte>}
     */
    Language{
        get {
            if(!this.HasProp("__LanguageProxyArray"))
                this.__LanguageProxyArray := Win32FixedArray(this.ptr + 32, 30, Primitive, "char")
            return this.__LanguageProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    OsString{
        get {
            if(!this.HasProp("__OsStringProxyArray"))
                this.__OsStringProxyArray := Win32FixedArray(this.ptr + 62, 64, Primitive, "char")
            return this.__OsStringProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    ServicePackString{
        get {
            if(!this.HasProp("__ServicePackStringProxyArray"))
                this.__ServicePackStringProxyArray := Win32FixedArray(this.ptr + 126, 64, Primitive, "char")
            return this.__ServicePackStringProxyArray
        }
    }
}
