#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\RANGEVALUE.ahk
#Include .\SCANWINDOW.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class SCANINFO extends Win32Struct
{
    static sizeof => 320

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ADF {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    TPA {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Endorser {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    OpticalXResolution {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    OpticalYResolution {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    BedWidth {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    BedHeight {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {RANGEVALUE}
     */
    IntensityRange{
        get {
            if(!this.HasProp("__IntensityRange"))
                this.__IntensityRange := RANGEVALUE(this.ptr + 32)
            return this.__IntensityRange
        }
    }

    /**
     * @type {RANGEVALUE}
     */
    ContrastRange{
        get {
            if(!this.HasProp("__ContrastRange"))
                this.__ContrastRange := RANGEVALUE(this.ptr + 48)
            return this.__ContrastRange
        }
    }

    /**
     * @type {Integer}
     */
    SupportedCompressionType {
        get => NumGet(this, 60, "int")
        set => NumPut("int", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    SupportedDataTypes {
        get => NumGet(this, 64, "int")
        set => NumPut("int", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    WidthPixels {
        get => NumGet(this, 68, "int")
        set => NumPut("int", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    WidthBytes {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    Lines {
        get => NumGet(this, 76, "int")
        set => NumPut("int", value, this, 76)
    }

    /**
     * @type {Integer}
     */
    DataType {
        get => NumGet(this, 80, "int")
        set => NumPut("int", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    PixelBits {
        get => NumGet(this, 84, "int")
        set => NumPut("int", value, this, 84)
    }

    /**
     * @type {Integer}
     */
    Intensity {
        get => NumGet(this, 88, "int")
        set => NumPut("int", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    Contrast {
        get => NumGet(this, 92, "int")
        set => NumPut("int", value, this, 92)
    }

    /**
     * @type {Integer}
     */
    Xresolution {
        get => NumGet(this, 96, "int")
        set => NumPut("int", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    Yresolution {
        get => NumGet(this, 100, "int")
        set => NumPut("int", value, this, 100)
    }

    /**
     * @type {SCANWINDOW}
     */
    Window{
        get {
            if(!this.HasProp("__Window"))
                this.__Window := SCANWINDOW(this.ptr + 104)
            return this.__Window
        }
    }

    /**
     * @type {Integer}
     */
    DitherPattern {
        get => NumGet(this, 120, "int")
        set => NumPut("int", value, this, 120)
    }

    /**
     * @type {Integer}
     */
    Negative {
        get => NumGet(this, 124, "int")
        set => NumPut("int", value, this, 124)
    }

    /**
     * @type {Integer}
     */
    Mirror {
        get => NumGet(this, 128, "int")
        set => NumPut("int", value, this, 128)
    }

    /**
     * @type {Integer}
     */
    AutoBack {
        get => NumGet(this, 132, "int")
        set => NumPut("int", value, this, 132)
    }

    /**
     * @type {Integer}
     */
    ColorDitherPattern {
        get => NumGet(this, 136, "int")
        set => NumPut("int", value, this, 136)
    }

    /**
     * @type {Integer}
     */
    ToneMap {
        get => NumGet(this, 140, "int")
        set => NumPut("int", value, this, 140)
    }

    /**
     * @type {Integer}
     */
    Compression {
        get => NumGet(this, 144, "int")
        set => NumPut("int", value, this, 144)
    }

    /**
     * @type {Integer}
     */
    RawDataFormat {
        get => NumGet(this, 148, "int")
        set => NumPut("int", value, this, 148)
    }

    /**
     * @type {Integer}
     */
    RawPixelOrder {
        get => NumGet(this, 152, "int")
        set => NumPut("int", value, this, 152)
    }

    /**
     * @type {Integer}
     */
    bNeedDataAlignment {
        get => NumGet(this, 156, "int")
        set => NumPut("int", value, this, 156)
    }

    /**
     * @type {Integer}
     */
    DelayBetweenRead {
        get => NumGet(this, 160, "int")
        set => NumPut("int", value, this, 160)
    }

    /**
     * @type {Integer}
     */
    MaxBufferSize {
        get => NumGet(this, 164, "int")
        set => NumPut("int", value, this, 164)
    }

    /**
     * @type {Array<HANDLE>}
     */
    DeviceIOHandles{
        get {
            if(!this.HasProp("__DeviceIOHandlesProxyArray"))
                this.__DeviceIOHandlesProxyArray := Win32FixedArray(this.ptr + 168, 8, HANDLE, "")
            return this.__DeviceIOHandlesProxyArray
        }
    }

    /**
     * @type {Array<Int32>}
     */
    lReserved{
        get {
            if(!this.HasProp("__lReservedProxyArray"))
                this.__lReservedProxyArray := Win32FixedArray(this.ptr + 296, 4, Primitive, "int")
            return this.__lReservedProxyArray
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    pMicroDriverContext {
        get => NumGet(this, 312, "ptr")
        set => NumPut("ptr", value, this, 312)
    }
}
