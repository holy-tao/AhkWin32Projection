#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSDATAFORMAT.ahk
#Include .\KS_VBIINFOHEADER.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KS_DATAFORMAT_VBIINFOHEADER extends Win32Struct
{
    static sizeof => 96

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
     * @type {KS_VBIINFOHEADER}
     */
    VBIInfoHeader{
        get {
            if(!this.HasProp("__VBIInfoHeader"))
                this.__VBIInfoHeader := KS_VBIINFOHEADER(this.ptr + 48)
            return this.__VBIInfoHeader
        }
    }
}
