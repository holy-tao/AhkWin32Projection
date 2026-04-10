#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSDATAFORMAT.ahk
#Include .\KS_VIDEOINFOHEADER2.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\KS_BITMAPINFOHEADER.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KS_DATAFORMAT_VIDEOINFOHEADER2 extends Win32Struct {
    static sizeof => 160

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
     * @type {KS_VIDEOINFOHEADER2}
     */
    VideoInfoHeader2 {
        get {
            if(!this.HasProp("__VideoInfoHeader2"))
                this.__VideoInfoHeader2 := KS_VIDEOINFOHEADER2(48, this)
            return this.__VideoInfoHeader2
        }
    }
}
