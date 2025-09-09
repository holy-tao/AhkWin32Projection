#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DXVA_AYUVsample2.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\DXVA_VideoSample32.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVA_DeinterlaceBltEx32 extends Win32Struct
{
    static sizeof => 304

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {DXVA_AYUVsample2}
     */
    BackgroundColor{
        get {
            if(!this.HasProp("__BackgroundColor"))
                this.__BackgroundColor := DXVA_AYUVsample2(this.ptr + 4)
            return this.__BackgroundColor
        }
    }

    /**
     * @type {RECT}
     */
    rcTarget{
        get {
            if(!this.HasProp("__rcTarget"))
                this.__rcTarget := RECT(this.ptr + 8)
            return this.__rcTarget
        }
    }

    /**
     * @type {Integer}
     */
    rtTarget {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    NumSourceSurfaces {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Float}
     */
    Alpha {
        get => NumGet(this, 36, "float")
        set => NumPut("float", value, this, 36)
    }

    /**
     * @type {Array<DXVA_VideoSample32>}
     */
    Source{
        get {
            if(!this.HasProp("__SourceProxyArray"))
                this.__SourceProxyArray := Win32FixedArray(this.ptr + 40, 32, DXVA_VideoSample32, "")
            return this.__SourceProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    DestinationFormat {
        get => NumGet(this, 296, "uint")
        set => NumPut("uint", value, this, 296)
    }

    /**
     * @type {Integer}
     */
    DestinationFlags {
        get => NumGet(this, 300, "uint")
        set => NumPut("uint", value, this, 300)
    }
}
