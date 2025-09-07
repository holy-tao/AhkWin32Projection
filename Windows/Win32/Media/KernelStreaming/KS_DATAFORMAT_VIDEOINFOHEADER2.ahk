#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSDATAFORMAT.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\KS_BITMAPINFOHEADER.ahk
#Include .\KS_VIDEOINFOHEADER2.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KS_DATAFORMAT_VIDEOINFOHEADER2 extends Win32Struct
{
    static sizeof => 160

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
     * @type {KS_VIDEOINFOHEADER2}
     */
    VideoInfoHeader2{
        get {
            if(!this.HasProp("__VideoInfoHeader2"))
                this.__VideoInfoHeader2 := KS_VIDEOINFOHEADER2(this.ptr + 48)
            return this.__VideoInfoHeader2
        }
    }
}
