#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class SIGNAL_REG_VALUE extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Array<Byte>}
     */
    RegName{
        get {
            if(!this.HasProp("__RegNameProxyArray"))
                this.__RegNameProxyArray := Win32FixedArray(this.ptr + 0, 32, Primitive, "char")
            return this.__RegNameProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    MsrAddr {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    Value {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
