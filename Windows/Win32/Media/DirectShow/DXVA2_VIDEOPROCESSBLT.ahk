#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\Foundation\SIZE.ahk
#Include ..\MediaFoundation\DXVA2_AYUVSample16.ahk
#Include ..\MediaFoundation\DXVA2_ExtendedFormat.ahk
#Include ..\MediaFoundation\DXVA2_Fixed32.ahk
#Include ..\MediaFoundation\DXVA2_ProcAmpValues.ahk
#Include ..\MediaFoundation\DXVA2_FilterValues.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DXVA2_VIDEOPROCESSBLT extends Win32Struct
{
    static sizeof => 160

    static packingSize => 8

    /**
     * @type {Integer}
     */
    TargetFrame {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * @type {RECT}
     */
    TargetRect{
        get {
            if(!this.HasProp("__TargetRect"))
                this.__TargetRect := RECT(this.ptr + 8)
            return this.__TargetRect
        }
    }

    /**
     * @type {SIZE}
     */
    ConstrictionSize{
        get {
            if(!this.HasProp("__ConstrictionSize"))
                this.__ConstrictionSize := SIZE(this.ptr + 24)
            return this.__ConstrictionSize
        }
    }

    /**
     * @type {Integer}
     */
    StreamingFlags {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {DXVA2_AYUVSample16}
     */
    BackgroundColor{
        get {
            if(!this.HasProp("__BackgroundColor"))
                this.__BackgroundColor := DXVA2_AYUVSample16(this.ptr + 40)
            return this.__BackgroundColor
        }
    }

    /**
     * @type {DXVA2_ExtendedFormat}
     */
    DestFormat{
        get {
            if(!this.HasProp("__DestFormat"))
                this.__DestFormat := DXVA2_ExtendedFormat(this.ptr + 48)
            return this.__DestFormat
        }
    }

    /**
     * @type {Integer}
     */
    DestFlags {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {DXVA2_ProcAmpValues}
     */
    ProcAmpValues{
        get {
            if(!this.HasProp("__ProcAmpValues"))
                this.__ProcAmpValues := DXVA2_ProcAmpValues(this.ptr + 56)
            return this.__ProcAmpValues
        }
    }

    /**
     * @type {DXVA2_Fixed32}
     */
    Alpha{
        get {
            if(!this.HasProp("__Alpha"))
                this.__Alpha := DXVA2_Fixed32(this.ptr + 72)
            return this.__Alpha
        }
    }

    /**
     * @type {DXVA2_FilterValues}
     */
    NoiseFilterLuma{
        get {
            if(!this.HasProp("__NoiseFilterLuma"))
                this.__NoiseFilterLuma := DXVA2_FilterValues(this.ptr + 80)
            return this.__NoiseFilterLuma
        }
    }

    /**
     * @type {DXVA2_FilterValues}
     */
    NoiseFilterChroma{
        get {
            if(!this.HasProp("__NoiseFilterChroma"))
                this.__NoiseFilterChroma := DXVA2_FilterValues(this.ptr + 96)
            return this.__NoiseFilterChroma
        }
    }

    /**
     * @type {DXVA2_FilterValues}
     */
    DetailFilterLuma{
        get {
            if(!this.HasProp("__DetailFilterLuma"))
                this.__DetailFilterLuma := DXVA2_FilterValues(this.ptr + 112)
            return this.__DetailFilterLuma
        }
    }

    /**
     * @type {DXVA2_FilterValues}
     */
    DetailFilterChroma{
        get {
            if(!this.HasProp("__DetailFilterChroma"))
                this.__DetailFilterChroma := DXVA2_FilterValues(this.ptr + 128)
            return this.__DetailFilterChroma
        }
    }

    /**
     * @type {Pointer<DXVA2_VIDEOSAMPLE>}
     */
    pSrcSurfaces {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }

    /**
     * @type {Integer}
     */
    NumSrcSurfaces {
        get => NumGet(this, 152, "uint")
        set => NumPut("uint", value, this, 152)
    }
}
