#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\SIZE.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KS_VIDEO_STREAM_CONFIG_CAPS extends Win32Struct
{
    static sizeof => 120

    static packingSize => 8

    /**
     * @type {Pointer<Guid>}
     */
    guid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    VideoStandard {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {SIZE}
     */
    InputSize{
        get {
            if(!this.HasProp("__InputSize"))
                this.__InputSize := SIZE(16, this)
            return this.__InputSize
        }
    }

    /**
     * @type {SIZE}
     */
    MinCroppingSize{
        get {
            if(!this.HasProp("__MinCroppingSize"))
                this.__MinCroppingSize := SIZE(24, this)
            return this.__MinCroppingSize
        }
    }

    /**
     * @type {SIZE}
     */
    MaxCroppingSize{
        get {
            if(!this.HasProp("__MaxCroppingSize"))
                this.__MaxCroppingSize := SIZE(32, this)
            return this.__MaxCroppingSize
        }
    }

    /**
     * @type {Integer}
     */
    CropGranularityX {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    CropGranularityY {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    CropAlignX {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    CropAlignY {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    /**
     * @type {SIZE}
     */
    MinOutputSize{
        get {
            if(!this.HasProp("__MinOutputSize"))
                this.__MinOutputSize := SIZE(56, this)
            return this.__MinOutputSize
        }
    }

    /**
     * @type {SIZE}
     */
    MaxOutputSize{
        get {
            if(!this.HasProp("__MaxOutputSize"))
                this.__MaxOutputSize := SIZE(64, this)
            return this.__MaxOutputSize
        }
    }

    /**
     * @type {Integer}
     */
    OutputGranularityX {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    OutputGranularityY {
        get => NumGet(this, 76, "int")
        set => NumPut("int", value, this, 76)
    }

    /**
     * @type {Integer}
     */
    StretchTapsX {
        get => NumGet(this, 80, "int")
        set => NumPut("int", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    StretchTapsY {
        get => NumGet(this, 84, "int")
        set => NumPut("int", value, this, 84)
    }

    /**
     * @type {Integer}
     */
    ShrinkTapsX {
        get => NumGet(this, 88, "int")
        set => NumPut("int", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    ShrinkTapsY {
        get => NumGet(this, 92, "int")
        set => NumPut("int", value, this, 92)
    }

    /**
     * @type {Integer}
     */
    MinFrameInterval {
        get => NumGet(this, 96, "int64")
        set => NumPut("int64", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    MaxFrameInterval {
        get => NumGet(this, 104, "int64")
        set => NumPut("int64", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    MinBitsPerSecond {
        get => NumGet(this, 112, "int")
        set => NumPut("int", value, this, 112)
    }

    /**
     * @type {Integer}
     */
    MaxBitsPerSecond {
        get => NumGet(this, 116, "int")
        set => NumPut("int", value, this, 116)
    }
}
