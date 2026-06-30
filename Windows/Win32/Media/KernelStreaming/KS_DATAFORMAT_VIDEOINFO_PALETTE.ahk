#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KS_BITMAPINFOHEADER.ahk
#Include .\KSDATAFORMAT.ahk
#Include .\KS_TRUECOLORINFO.ahk
#Include .\KS_VIDEOINFO.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\KS_RGBQUAD.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KS_DATAFORMAT_VIDEOINFO_PALETTE extends Win32Struct {
    static sizeof => 1200

    static packingSize => 8

    /**
     * @type {KSDATAFORMAT}
     */
    DataFormat {
        get {
            if(!this.HasProp("__DataFormat"))
                this.__DataFormat := KSDATAFORMAT(0, this)
            return this.__DataFormat
        }
    }

    /**
     * @type {KS_VIDEOINFO}
     */
    VideoInfo {
        get {
            if(!this.HasProp("__VideoInfo"))
                this.__VideoInfo := KS_VIDEOINFO(72, this)
            return this.__VideoInfo
        }
    }
}
