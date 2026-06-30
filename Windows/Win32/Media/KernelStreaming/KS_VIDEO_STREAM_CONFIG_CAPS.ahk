#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\SIZE.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KS_VIDEO_STREAM_CONFIG_CAPS extends Win32Struct {
    static sizeof => 128

    static packingSize => 8

    /**
     * @type {Guid}
     */
    guid {
        get {
            if(!this.HasProp("__guid"))
                this.__guid := Guid(0, this)
            return this.__guid
        }
    }

    /**
     * @type {Integer}
     */
    VideoStandard {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {SIZE}
     */
    InputSize {
        get {
            if(!this.HasProp("__InputSize"))
                this.__InputSize := SIZE(20, this)
            return this.__InputSize
        }
    }

    /**
     * @type {SIZE}
     */
    MinCroppingSize {
        get {
            if(!this.HasProp("__MinCroppingSize"))
                this.__MinCroppingSize := SIZE(28, this)
            return this.__MinCroppingSize
        }
    }

    /**
     * @type {SIZE}
     */
    MaxCroppingSize {
        get {
            if(!this.HasProp("__MaxCroppingSize"))
                this.__MaxCroppingSize := SIZE(36, this)
            return this.__MaxCroppingSize
        }
    }

    /**
     * @type {Integer}
     */
    CropGranularityX {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    CropGranularityY {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    CropAlignX {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    CropAlignY {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * @type {SIZE}
     */
    MinOutputSize {
        get {
            if(!this.HasProp("__MinOutputSize"))
                this.__MinOutputSize := SIZE(60, this)
            return this.__MinOutputSize
        }
    }

    /**
     * @type {SIZE}
     */
    MaxOutputSize {
        get {
            if(!this.HasProp("__MaxOutputSize"))
                this.__MaxOutputSize := SIZE(68, this)
            return this.__MaxOutputSize
        }
    }

    /**
     * @type {Integer}
     */
    OutputGranularityX {
        get => NumGet(this, 76, "int")
        set => NumPut("int", value, this, 76)
    }

    /**
     * @type {Integer}
     */
    OutputGranularityY {
        get => NumGet(this, 80, "int")
        set => NumPut("int", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    StretchTapsX {
        get => NumGet(this, 84, "int")
        set => NumPut("int", value, this, 84)
    }

    /**
     * @type {Integer}
     */
    StretchTapsY {
        get => NumGet(this, 88, "int")
        set => NumPut("int", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    ShrinkTapsX {
        get => NumGet(this, 92, "int")
        set => NumPut("int", value, this, 92)
    }

    /**
     * @type {Integer}
     */
    ShrinkTapsY {
        get => NumGet(this, 96, "int")
        set => NumPut("int", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    MinFrameInterval {
        get => NumGet(this, 104, "int64")
        set => NumPut("int64", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    MaxFrameInterval {
        get => NumGet(this, 112, "int64")
        set => NumPut("int64", value, this, 112)
    }

    /**
     * @type {Integer}
     */
    MinBitsPerSecond {
        get => NumGet(this, 120, "int")
        set => NumPut("int", value, this, 120)
    }

    /**
     * @type {Integer}
     */
    MaxBitsPerSecond {
        get => NumGet(this, 124, "int")
        set => NumPut("int", value, this, 124)
    }
}
