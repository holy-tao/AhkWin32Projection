#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class WIM_PROVIDER_EXTERNAL_INFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    DataSourceId {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * @type {Array<Byte>}
     */
    ResourceHash{
        get {
            if(!this.HasProp("__ResourceHashProxyArray"))
                this.__ResourceHashProxyArray := Win32FixedArray(this.ptr + 16, 20, Primitive, "char")
            return this.__ResourceHashProxyArray
        }
    }
}
