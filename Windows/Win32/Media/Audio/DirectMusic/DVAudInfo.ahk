#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 * @version v4.0.30319
 */
class DVAudInfo extends Win32Struct
{
    static sizeof => 16

    static packingSize => 2

    /**
     * @type {Array<Byte>}
     */
    bAudStyle{
        get {
            if(!this.HasProp("__bAudStyleProxyArray"))
                this.__bAudStyleProxyArray := Win32FixedArray(this.ptr + 0, 2, Primitive, "char")
            return this.__bAudStyleProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    bAudQu{
        get {
            if(!this.HasProp("__bAudQuProxyArray"))
                this.__bAudQuProxyArray := Win32FixedArray(this.ptr + 2, 2, Primitive, "char")
            return this.__bAudQuProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    bNumAudPin {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * @type {Array<UInt16>}
     */
    wAvgSamplesPerPinPerFrm{
        get {
            if(!this.HasProp("__wAvgSamplesPerPinPerFrmProxyArray"))
                this.__wAvgSamplesPerPinPerFrmProxyArray := Win32FixedArray(this.ptr + 6, 2, Primitive, "ushort")
            return this.__wAvgSamplesPerPinPerFrmProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    wBlkMode {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * @type {Integer}
     */
    wDIFMode {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    wBlkDiv {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }
}
