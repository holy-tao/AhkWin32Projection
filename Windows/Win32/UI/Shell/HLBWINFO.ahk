#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\HLTBINFO.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class HLBWINFO extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    grfHLBWIF {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {RECT}
     */
    rcFramePos{
        get {
            if(!this.HasProp("__rcFramePos"))
                this.__rcFramePos := RECT(8, this)
            return this.__rcFramePos
        }
    }

    /**
     * @type {RECT}
     */
    rcDocPos{
        get {
            if(!this.HasProp("__rcDocPos"))
                this.__rcDocPos := RECT(24, this)
            return this.__rcDocPos
        }
    }

    /**
     * @type {HLTBINFO}
     */
    hltbinfo{
        get {
            if(!this.HasProp("__hltbinfo"))
                this.__hltbinfo := HLTBINFO(40, this)
            return this.__hltbinfo
        }
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 64
    }
}
