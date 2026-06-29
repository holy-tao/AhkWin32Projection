#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KS_H264VIDEOINFO.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\KSDATAFORMAT.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KS_DATAFORMAT_H264VIDEOINFO extends Win32Struct {
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
     * @type {KS_H264VIDEOINFO}
     */
    H264VideoInfoHeader {
        get {
            if(!this.HasProp("__H264VideoInfoHeader"))
                this.__H264VideoInfoHeader := KS_H264VIDEOINFO(72, this)
            return this.__H264VideoInfoHeader
        }
    }
}
