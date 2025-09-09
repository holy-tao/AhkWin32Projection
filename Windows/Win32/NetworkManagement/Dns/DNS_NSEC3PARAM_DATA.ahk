#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_NSEC3PARAM_DATA extends Win32Struct
{
    static sizeof => 10

    static packingSize => 2

    /**
     * @type {Integer}
     */
    chAlgorithm {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    bFlags {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    wIterations {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    bSaltLength {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * @type {Array<Byte>}
     */
    bPad{
        get {
            if(!this.HasProp("__bPadProxyArray"))
                this.__bPadProxyArray := Win32FixedArray(this.ptr + 5, 3, Primitive, "char")
            return this.__bPadProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    pbSalt{
        get {
            if(!this.HasProp("__pbSaltProxyArray"))
                this.__pbSaltProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__pbSaltProxyArray
        }
    }
}
