#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\KSDATAFORMAT.ahk
#Include .\KS_BITMAPINFOHEADER.ahk
#Include .\KS_VIDEOINFOHEADER.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KS_DATAFORMAT_VIDEOINFOHEADER extends Win32Struct {
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
     * @type {KS_VIDEOINFOHEADER}
     */
    VideoInfoHeader {
        get {
            if(!this.HasProp("__VideoInfoHeader"))
                this.__VideoInfoHeader := KS_VIDEOINFOHEADER(72, this)
            return this.__VideoInfoHeader
        }
    }
}
