#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class VIDEO_POINTER_ATTRIBUTES extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Width {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Height {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    WidthInBytes {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    Enable {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Column {
        get => NumGet(this, 20, "short")
        set => NumPut("short", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    Row {
        get => NumGet(this, 22, "short")
        set => NumPut("short", value, this, 22)
    }

    /**
     * @type {Array<Byte>}
     */
    Pixels{
        get {
            if(!this.HasProp("__PixelsProxyArray"))
                this.__PixelsProxyArray := Win32FixedArray(this.ptr + 24, 1, Primitive, "char")
            return this.__PixelsProxyArray
        }
    }
}
