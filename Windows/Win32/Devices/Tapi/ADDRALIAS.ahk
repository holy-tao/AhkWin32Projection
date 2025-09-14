#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ADDRALIAS extends Win32Struct
{
    static sizeof => 72

    static packingSize => 4

    /**
     * @type {Array<SByte>}
     */
    rgchName{
        get {
            if(!this.HasProp("__rgchNameProxyArray"))
                this.__rgchNameProxyArray := Win32FixedArray(this.ptr + 0, 41, Primitive, "char")
            return this.__rgchNameProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    rgchEName{
        get {
            if(!this.HasProp("__rgchENameProxyArray"))
                this.__rgchENameProxyArray := Win32FixedArray(this.ptr + 41, 11, Primitive, "char")
            return this.__rgchENameProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    rgchSrvr{
        get {
            if(!this.HasProp("__rgchSrvrProxyArray"))
                this.__rgchSrvrProxyArray := Win32FixedArray(this.ptr + 52, 12, Primitive, "char")
            return this.__rgchSrvrProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    dibDetail {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    type {
        get => NumGet(this, 68, "ushort")
        set => NumPut("ushort", value, this, 68)
    }
}
