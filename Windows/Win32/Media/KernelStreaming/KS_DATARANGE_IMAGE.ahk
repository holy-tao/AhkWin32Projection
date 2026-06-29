#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\KSDATAFORMAT.ahk
#Include .\KS_VIDEO_STREAM_CONFIG_CAPS.ahk
#Include .\KS_BITMAPINFOHEADER.ahk
#Include ..\..\Foundation\SIZE.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KS_DATARANGE_IMAGE extends Win32Struct {
    static sizeof => 240

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
     * @type {KS_VIDEO_STREAM_CONFIG_CAPS}
     */
    ConfigCaps {
        get {
            if(!this.HasProp("__ConfigCaps"))
                this.__ConfigCaps := KS_VIDEO_STREAM_CONFIG_CAPS(72, this)
            return this.__ConfigCaps
        }
    }

    /**
     * @type {KS_BITMAPINFOHEADER}
     */
    ImageInfoHeader {
        get {
            if(!this.HasProp("__ImageInfoHeader"))
                this.__ImageInfoHeader := KS_BITMAPINFOHEADER(200, this)
            return this.__ImageInfoHeader
        }
    }
}
