#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KS_VIDEOINFOHEADER2.ahk
#Include .\KS_BITMAPINFOHEADER.ahk
#Include ..\..\Foundation\SIZE.ahk
#Include .\KSDATAFORMAT.ahk
#Include .\KS_VIDEO_STREAM_CONFIG_CAPS.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KS_DATARANGE_VIDEO2 extends Win32Struct {
    static sizeof => 328

    static packingSize => 8

    /**
     * @type {KSDATAFORMAT}
     */
    DataRange {
        get {
            if(!this.HasProp("__DataRange"))
                this.__DataRange := KSDATAFORMAT(0, this)
            return this.__DataRange
        }
    }

    /**
     * @type {BOOL}
     */
    bFixedSizeSamples {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }

    /**
     * @type {BOOL}
     */
    bTemporalCompression {
        get => NumGet(this, 76, "int")
        set => NumPut("int", value, this, 76)
    }

    /**
     * @type {Integer}
     */
    StreamDescriptionFlags {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    MemoryAllocationFlags {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * @type {KS_VIDEO_STREAM_CONFIG_CAPS}
     */
    ConfigCaps {
        get {
            if(!this.HasProp("__ConfigCaps"))
                this.__ConfigCaps := KS_VIDEO_STREAM_CONFIG_CAPS(88, this)
            return this.__ConfigCaps
        }
    }

    /**
     * @type {KS_VIDEOINFOHEADER2}
     */
    VideoInfoHeader {
        get {
            if(!this.HasProp("__VideoInfoHeader"))
                this.__VideoInfoHeader := KS_VIDEOINFOHEADER2(216, this)
            return this.__VideoInfoHeader
        }
    }
}
