#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SPGRAMMARHANDLE.ahk
#Include .\SPRECORESULTINFO.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SPRECORESULTINFOEX extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * @type {SPRECORESULTINFO}
     */
    Base{
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
