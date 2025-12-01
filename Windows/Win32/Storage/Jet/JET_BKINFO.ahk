#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\JET_LGPOS.ahk
#Include .\JET_LOGTIME.ahk
#Include .\JET_BKLOGTIME.ahk

/**
 * Learn more about: JET_BKINFO structure
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-bkinfo-structure2
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
                this.__lgposMark := JET_LGPOS(0, this)
            return this.__lgposMark
        }
    }

    /**
     * @type {JET_LOGTIME}
     */
    logtimeMark{
        get {
            if(!this.HasProp("__logtimeMark"))
                this.__logtimeMark := JET_LOGTIME(8, this)
            return this.__logtimeMark
        }
    }

    /**
     * @type {JET_BKLOGTIME}
     */
    bklogtimeMark{
        get {
            if(!this.HasProp("__bklogtimeMark"))
                this.__bklogtimeMark := JET_BKLOGTIME(8, this)
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
