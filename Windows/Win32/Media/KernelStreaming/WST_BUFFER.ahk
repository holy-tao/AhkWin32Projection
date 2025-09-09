#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VBICODECFILTERING_SCANLINES.ahk
#Include .\WST_BUFFER_LINE.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class WST_BUFFER extends Win32Struct
{
    static sizeof => 264

    static packingSize => 8

    /**
     * @type {VBICODECFILTERING_SCANLINES}
     */
    ScanlinesRequested{
        get {
            if(!this.HasProp("__ScanlinesRequested"))
                this.__ScanlinesRequested := VBICODECFILTERING_SCANLINES(this.ptr + 0)
            return this.__ScanlinesRequested
        }
    }

    /**
     * @type {Array<WST_BUFFER_LINE>}
     */
    WstLines{
        get {
            if(!this.HasProp("__WstLinesProxyArray"))
                this.__WstLinesProxyArray := Win32FixedArray(this.ptr + 128, 17, WST_BUFFER_LINE, "")
            return this.__WstLinesProxyArray
        }
    }
}
