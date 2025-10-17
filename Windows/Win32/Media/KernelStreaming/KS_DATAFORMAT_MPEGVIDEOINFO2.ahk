#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSDATAFORMAT.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\KS_BITMAPINFOHEADER.ahk
#Include .\KS_VIDEOINFOHEADER2.ahk
#Include .\KS_MPEGVIDEOINFO2.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KS_DATAFORMAT_MPEGVIDEOINFO2 extends Win32Struct
{
    static sizeof => 184

    static packingSize => 8

    /**
     * @type {KSDATAFORMAT}
     */
    DataFormat{
        get {
            if(!this.HasProp("__DataFormat"))
                this.__DataFormat := KSDATAFORMAT(0, this)
            return this.__DataFormat
        }
    }

    /**
     * @type {KS_MPEGVIDEOINFO2}
     */
    MpegVideoInfoHeader2{
        get {
            if(!this.HasProp("__MpegVideoInfoHeader2"))
                this.__MpegVideoInfoHeader2 := KS_MPEGVIDEOINFO2(48, this)
            return this.__MpegVideoInfoHeader2
        }
    }
}
