#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_FIRMWARE_SLOT_INFO_LOG extends Win32Struct
{
    static sizeof => 512

    static packingSize => 8

    /**
     * @type {Integer}
     */
    AFI {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved0{
        get {
            if(!this.HasProp("__Reserved0ProxyArray"))
                this.__Reserved0ProxyArray := Win32FixedArray(this.ptr + 1, 7, Primitive, "char")
            return this.__Reserved0ProxyArray
        }
    }

    /**
     * @type {Array<UInt64>}
     */
    FRS{
        get {
            if(!this.HasProp("__FRSProxyArray"))
                this.__FRSProxyArray := Win32FixedArray(this.ptr + 8, 7, Primitive, "uint")
            return this.__FRSProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 64, 448, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }
}
