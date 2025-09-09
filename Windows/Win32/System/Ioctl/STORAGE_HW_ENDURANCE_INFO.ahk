#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_HW_ENDURANCE_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 4

    /**
     * @type {Integer}
     */
    ValidFields {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    GroupId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    LifePercentage {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Array<Byte>}
     */
    BytesReadCount{
        get {
            if(!this.HasProp("__BytesReadCountProxyArray"))
                this.__BytesReadCountProxyArray := Win32FixedArray(this.ptr + 16, 16, Primitive, "char")
            return this.__BytesReadCountProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    ByteWriteCount{
        get {
            if(!this.HasProp("__ByteWriteCountProxyArray"))
                this.__ByteWriteCountProxyArray := Win32FixedArray(this.ptr + 32, 16, Primitive, "char")
            return this.__ByteWriteCountProxyArray
        }
    }
}
