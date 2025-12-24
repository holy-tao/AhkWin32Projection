#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KS_AMVPSIZE.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSVPMAXPIXELRATE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {KS_AMVPSIZE}
     */
    Size{
        get {
            if(!this.HasProp("__Size"))
                this.__Size := KS_AMVPSIZE(0, this)
            return this.__Size
        }
    }

    /**
     * @type {Integer}
     */
    MaxPixelsPerSecond {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
