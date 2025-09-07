#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSDATAFORMAT.ahk
#Include .\KS_H264VIDEOINFO.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KS_DATAFORMAT_H264VIDEOINFO extends Win32Struct
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
     * @type {KS_H264VIDEOINFO}
     */
    H264VideoInfoHeader{
        get {
            if(!this.HasProp("__H264VideoInfoHeader"))
                this.__H264VideoInfoHeader := KS_H264VIDEOINFO(this.ptr + 48)
            return this.__H264VideoInfoHeader
        }
    }
}
