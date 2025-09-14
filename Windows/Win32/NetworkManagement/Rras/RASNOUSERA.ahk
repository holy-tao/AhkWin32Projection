#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 * @charset ANSI
 */
class RASNOUSERA extends Win32Struct
{
    static sizeof => 544

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dwTimeoutMs {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<SByte>}
     */
    szUserName{
        get {
            if(!this.HasProp("__szUserNameProxyArray"))
                this.__szUserNameProxyArray := Win32FixedArray(this.ptr + 12, 257, Primitive, "char")
            return this.__szUserNameProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    szPassword{
        get {
            if(!this.HasProp("__szPasswordProxyArray"))
                this.__szPasswordProxyArray := Win32FixedArray(this.ptr + 269, 257, Primitive, "char")
            return this.__szPasswordProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    szDomain{
        get {
            if(!this.HasProp("__szDomainProxyArray"))
                this.__szDomainProxyArray := Win32FixedArray(this.ptr + 526, 16, Primitive, "char")
            return this.__szDomainProxyArray
        }
    }
}
