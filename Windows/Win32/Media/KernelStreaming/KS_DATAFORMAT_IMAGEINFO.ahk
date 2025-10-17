#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSDATAFORMAT.ahk
#Include .\KS_BITMAPINFOHEADER.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KS_DATAFORMAT_IMAGEINFO extends Win32Struct
{
    static sizeof => 88

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
     * @type {KS_BITMAPINFOHEADER}
     */
    ImageInfoHeader{
        get {
            if(!this.HasProp("__ImageInfoHeader"))
                this.__ImageInfoHeader := KS_BITMAPINFOHEADER(48, this)
            return this.__ImageInfoHeader
        }
    }
}
