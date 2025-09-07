#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSDATAFORMAT.ahk
#Include ..\..\Foundation\SIZE.ahk
#Include .\KS_VIDEO_STREAM_CONFIG_CAPS.ahk
#Include .\KS_BITMAPINFOHEADER.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KS_DATARANGE_IMAGE extends Win32Struct
{
    static sizeof => 208

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
     * @type {KS_VIDEO_STREAM_CONFIG_CAPS}
     */
    ConfigCaps{
        get {
            if(!this.HasProp("__ConfigCaps"))
                this.__ConfigCaps := KS_VIDEO_STREAM_CONFIG_CAPS(this.ptr + 48)
            return this.__ConfigCaps
        }
    }

    /**
     * @type {KS_BITMAPINFOHEADER}
     */
    ImageInfoHeader{
        get {
            if(!this.HasProp("__ImageInfoHeader"))
                this.__ImageInfoHeader := KS_BITMAPINFOHEADER(this.ptr + 168)
            return this.__ImageInfoHeader
        }
    }
}
