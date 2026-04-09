#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VBICODECFILTERING_SCANLINES.ahk
#Include .\WST_BUFFER_LINE.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class WST_BUFFER extends Win32Struct {
    static sizeof => 860

    static packingSize => 4

    /**
     * @type {VBICODECFILTERING_SCANLINES}
     */
    ScanlinesRequested {
        get {
            if(!this.HasProp("__ScanlinesRequested"))
                this.__ScanlinesRequested := VBICODECFILTERING_SCANLINES(0, this)
            return this.__ScanlinesRequested
        }
    }

    /**
     * @type {WST_BUFFER_LINE}
     */
    WstLines {
        get {
            if(!this.HasProp("__WstLinesProxyArray"))
                this.__WstLinesProxyArray := Win32FixedArray(this.ptr + 128, 17, WST_BUFFER_LINE, "")
            return this.__WstLinesProxyArray
        }
    }
}
