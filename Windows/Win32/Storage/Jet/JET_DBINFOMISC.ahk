#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\JET_LOGTIME.ahk
#Include .\JET_SIGNATURE.ahk
#Include .\JET_LGPOS.ahk
#Include .\JET_BKLOGTIME.ahk
#Include .\JET_BKINFO.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-dbinfomisc-constructor
 * @namespace Windows.Win32.Storage.Jet
 * @version v4.0.30319
 */
class JET_DBINFOMISC extends Win32Struct
{
    static sizeof => 232

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ulVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ulUpdate {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {JET_SIGNATURE}
     */
    signDb{
        get {
            if(!this.HasProp("__signDb"))
                this.__signDb := JET_SIGNATURE(8, this)
            return this.__signDb
        }
    }

    /**
     * @type {Integer}
     */
    dbstate {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {JET_LGPOS}
     */
    lgposConsistent{
        get {
            if(!this.HasProp("__lgposConsistent"))
                this.__lgposConsistent := JET_LGPOS(48, this)
            return this.__lgposConsistent
        }
    }

    /**
     * @type {JET_LOGTIME}
     */
    logtimeConsistent{
        get {
            if(!this.HasProp("__logtimeConsistent"))
                this.__logtimeConsistent := JET_LOGTIME(56, this)
            return this.__logtimeConsistent
        }
    }

    /**
     * @type {JET_LOGTIME}
     */
    logtimeAttach{
        get {
            if(!this.HasProp("__logtimeAttach"))
                this.__logtimeAttach := JET_LOGTIME(64, this)
            return this.__logtimeAttach
        }
    }

    /**
     * @type {JET_LGPOS}
     */
    lgposAttach{
        get {
            if(!this.HasProp("__lgposAttach"))
                this.__lgposAttach := JET_LGPOS(72, this)
            return this.__lgposAttach
        }
    }

    /**
     * @type {JET_LOGTIME}
     */
    logtimeDetach{
        get {
            if(!this.HasProp("__logtimeDetach"))
                this.__logtimeDetach := JET_LOGTIME(80, this)
            return this.__logtimeDetach
        }
    }

    /**
     * @type {JET_LGPOS}
     */
    lgposDetach{
        get {
            if(!this.HasProp("__lgposDetach"))
                this.__lgposDetach := JET_LGPOS(88, this)
            return this.__lgposDetach
        }
    }

    /**
     * @type {JET_SIGNATURE}
     */
    signLog{
        get {
            if(!this.HasProp("__signLog"))
                this.__signLog := JET_SIGNATURE(96, this)
            return this.__signLog
        }
    }

    /**
     * @type {JET_BKINFO}
     */
    bkinfoFullPrev{
        get {
            if(!this.HasProp("__bkinfoFullPrev"))
                this.__bkinfoFullPrev := JET_BKINFO(128, this)
            return this.__bkinfoFullPrev
        }
    }

    /**
     * @type {JET_BKINFO}
     */
    bkinfoIncPrev{
        get {
            if(!this.HasProp("__bkinfoIncPrev"))
                this.__bkinfoIncPrev := JET_BKINFO(152, this)
            return this.__bkinfoIncPrev
        }
    }

    /**
     * @type {JET_BKINFO}
     */
    bkinfoFullCur{
        get {
            if(!this.HasProp("__bkinfoFullCur"))
                this.__bkinfoFullCur := JET_BKINFO(176, this)
            return this.__bkinfoFullCur
        }
    }

    /**
     * @type {Integer}
     */
    fShadowingDisabled {
        get => NumGet(this, 200, "uint")
        set => NumPut("uint", value, this, 200)
    }

    /**
     * @type {Integer}
     */
    fUpgradeDb {
        get => NumGet(this, 204, "uint")
        set => NumPut("uint", value, this, 204)
    }

    /**
     * @type {Integer}
     */
    dwMajorVersion {
        get => NumGet(this, 208, "uint")
        set => NumPut("uint", value, this, 208)
    }

    /**
     * @type {Integer}
     */
    dwMinorVersion {
        get => NumGet(this, 212, "uint")
        set => NumPut("uint", value, this, 212)
    }

    /**
     * @type {Integer}
     */
    dwBuildNumber {
        get => NumGet(this, 216, "uint")
        set => NumPut("uint", value, this, 216)
    }

    /**
     * @type {Integer}
     */
    lSPNumber {
        get => NumGet(this, 220, "int")
        set => NumPut("int", value, this, 220)
    }

    /**
     * @type {Integer}
     */
    cbPageSize {
        get => NumGet(this, 224, "uint")
        set => NumPut("uint", value, this, 224)
    }
}
