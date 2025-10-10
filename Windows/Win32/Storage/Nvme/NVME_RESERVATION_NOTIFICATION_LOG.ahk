#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_RESERVATION_NOTIFICATION_LOG extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {Integer}
     */
    LogPageCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    LogPageType {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    AvailableLogPageCount {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved0{
        get {
            if(!this.HasProp("__Reserved0ProxyArray"))
                this.__Reserved0ProxyArray := Win32FixedArray(this.ptr + 10, 2, Primitive, "char")
            return this.__Reserved0ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    NameSpaceId {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 16, 48, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }
}
