#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSDATAFORMAT.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\KS_BITMAPINFOHEADER.ahk
#Include .\KS_VIDEOINFOHEADER.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KS_DATAFORMAT_VIDEOINFOHEADER extends Win32Struct
{
    static sizeof => 136

    static packingSize => 8

    /**
     * @type {KSDATAFORMAT}
     */
    DataFormat{
        get {
            if(!this.HasProp("__DataFormat"))
                this.__DataFormat := KSDATAFORMAT(this.ptr + 0)
            return this.__DataFormat
        }
    }

    /**
     * @type {KS_VIDEOINFOHEADER}
     */
    VideoInfoHeader{
        get {
            if(!this.HasProp("__VideoInfoHeader"))
                this.__VideoInfoHeader := KS_VIDEOINFOHEADER(this.ptr + 48)
            return this.__VideoInfoHeader
        }
    }
}
