#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSDATAFORMAT.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Foundation\SIZE.ahk
#Include .\KS_VIDEO_STREAM_CONFIG_CAPS.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\KS_BITMAPINFOHEADER.ahk
#Include .\KS_VIDEOINFOHEADER.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KS_DATARANGE_VIDEO extends Win32Struct
{
    static sizeof => 272

    static packingSize => 8

    /**
     * @type {KSDATAFORMAT}
     */
    DataRange{
        get {
            if(!this.HasProp("__DataRange"))
                this.__DataRange := KSDATAFORMAT(this.ptr + 0)
            return this.__DataRange
        }
    }

    /**
     * @type {BOOL}
     */
    bFixedSizeSamples{
        get {
            if(!this.HasProp("__bFixedSizeSamples"))
                this.__bFixedSizeSamples := BOOL(this.ptr + 48)
            return this.__bFixedSizeSamples
        }
    }

    /**
     * @type {BOOL}
     */
    bTemporalCompression{
        get {
            if(!this.HasProp("__bTemporalCompression"))
                this.__bTemporalCompression := BOOL(this.ptr + 52)
            return this.__bTemporalCompression
        }
    }

    /**
     * @type {Integer}
     */
    StreamDescriptionFlags {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    MemoryAllocationFlags {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * @type {KS_VIDEO_STREAM_CONFIG_CAPS}
     */
    ConfigCaps{
        get {
            if(!this.HasProp("__ConfigCaps"))
                this.__ConfigCaps := KS_VIDEO_STREAM_CONFIG_CAPS(this.ptr + 64)
            return this.__ConfigCaps
        }
    }

    /**
     * @type {KS_VIDEOINFOHEADER}
     */
    VideoInfoHeader{
        get {
            if(!this.HasProp("__VideoInfoHeader"))
                this.__VideoInfoHeader := KS_VIDEOINFOHEADER(this.ptr + 184)
            return this.__VideoInfoHeader
        }
    }
}
