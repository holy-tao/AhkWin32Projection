#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\JET_LGPOS.ahk
#Include .\JET_LOGTIME.ahk
#Include .\JET_BKLOGTIME.ahk

/**
 * @namespace Windows.Win32.Storage.Jet
 * @version v4.0.30319
 */
class JET_BKINFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {JET_LGPOS}
     */
    lgposMark{
        get {
            if(!this.HasProp("__lgposMark"))
                this.__lgposMark := JET_LGPOS(this.ptr + 0)
            return this.__lgposMark
        }
    }

    /**
     * @type {JET_LOGTIME}
     */
    logtimeMark{
        get {
            if(!this.HasProp("__logtimeMark"))
                this.__logtimeMark := JET_LOGTIME(this.ptr + 8)
            return this.__logtimeMark
        }
    }

    /**
     * @type {JET_BKLOGTIME}
     */
    bklogtimeMark{
        get {
            if(!this.HasProp("__bklogtimeMark"))
                this.__bklogtimeMark := JET_BKLOGTIME(this.ptr + 8)
            return this.__bklogtimeMark
        }
    }

    /**
     * @type {Integer}
     */
    genLow {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    genHigh {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
