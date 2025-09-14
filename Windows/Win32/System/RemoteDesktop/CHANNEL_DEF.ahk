#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class CHANNEL_DEF extends Win32Struct
{
    static sizeof => 12

    static packingSize => 1

    /**
     * @type {Array<SByte>}
     */
    name{
        get {
            if(!this.HasProp("__nameProxyArray"))
                this.__nameProxyArray := Win32FixedArray(this.ptr + 0, 8, Primitive, "char")
            return this.__nameProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    options {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
