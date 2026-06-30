#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SPPHRASEALT.ahk
#Include .\SPRECORESULTINFO.ahk
#Include .\SPRESULTTYPE.ahk
#Include .\ISpPhraseBuilder.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include .\SPGRAMMARHANDLE.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class SPRECORESULTINFOEX extends Win32Struct {
    static sizeof => 96

    static packingSize => 8

    /**
     * @type {SPRECORESULTINFO}
     */
    Base {
        get {
            if(!this.HasProp("__Base"))
                this.__Base := SPRECORESULTINFO(0, this)
            return this.__Base
        }
    }

    /**
     * @type {Integer}
     */
    ullStreamTimeStart {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    ullStreamTimeEnd {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }
}
