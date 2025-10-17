#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSDATAFORMAT.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\KS_ANALOGVIDEOINFO.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KS_DATARANGE_ANALOGVIDEO extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * @type {KSDATAFORMAT}
     */
    DataRange{
        get {
            if(!this.HasProp("__DataRange"))
                this.__DataRange := KSDATAFORMAT(0, this)
            return this.__DataRange
        }
    }

    /**
     * @type {KS_ANALOGVIDEOINFO}
     */
    AnalogVideoInfo{
        get {
            if(!this.HasProp("__AnalogVideoInfo"))
                this.__AnalogVideoInfo := KS_ANALOGVIDEOINFO(48, this)
            return this.__AnalogVideoInfo
        }
    }
}
