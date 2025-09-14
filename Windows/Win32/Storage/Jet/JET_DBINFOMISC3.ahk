#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\JET_LOGTIME.ahk
#Include .\JET_SIGNATURE.ahk
#Include .\JET_LGPOS.ahk
#Include .\JET_BKLOGTIME.ahk
#Include .\JET_BKINFO.ahk

/**
 * Learn more about: JET_DBINFOMISC3 Structure
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-dbinfomisc3-structure
 * @namespace Windows.Win32.Storage.Jet
 * @version v4.0.30319
 */
class JET_DBINFOMISC3 extends Win32Struct
{
    static sizeof => 312

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
                this.__signDb := JET_SIGNATURE(this.ptr + 8)
            return this.__signDb
        }
    }

    /**
     * @type {Integer}
     */
    dbstate {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {JET_LGPOS}
     */
    lgposConsistent{
        get {
            if(!this.HasProp("__lgposConsistent"))
                this.__lgposConsistent := JET_LGPOS(this.ptr + 40)
            return this.__lgposConsistent
        }
    }

    /**
     * @type {JET_LOGTIME}
     */
    logtimeConsistent{
        get {
            if(!this.HasProp("__logtimeConsistent"))
                this.__logtimeConsistent := JET_LOGTIME(this.ptr + 48)
            return this.__logtimeConsistent
        }
    }

    /**
     * @type {JET_LOGTIME}
     */
    logtimeAttach{
        get {
            if(!this.HasProp("__logtimeAttach"))
                this.__logtimeAttach := JET_LOGTIME(this.ptr + 56)
            return this.__logtimeAttach
        }
    }

    /**
     * @type {JET_LGPOS}
     */
    lgposAttach{
        get {
            if(!this.HasProp("__lgposAttach"))
                this.__lgposAttach := JET_LGPOS(this.ptr + 64)
            return this.__lgposAttach
        }
    }

    /**
     * @type {JET_LOGTIME}
     */
    logtimeDetach{
        get {
            if(!this.HasProp("__logtimeDetach"))
                this.__logtimeDetach := JET_LOGTIME(this.ptr + 72)
            return this.__logtimeDetach
        }
    }

    /**
     * @type {JET_LGPOS}
     */
    lgposDetach{
        get {
            if(!this.HasProp("__lgposDetach"))
                this.__lgposDetach := JET_LGPOS(this.ptr + 80)
            return this.__lgposDetach
        }
    }

    /**
     * @type {JET_SIGNATURE}
     */
    signLog{
        get {
            if(!this.HasProp("__signLog"))
                this.__signLog := JET_SIGNATURE(this.ptr + 88)
            return this.__signLog
        }
    }

    /**
     * @type {JET_BKINFO}
     */
    bkinfoFullPrev{
        get {
            if(!this.HasProp("__bkinfoFullPrev"))
                this.__bkinfoFullPrev := JET_BKINFO(this.ptr + 120)
            return this.__bkinfoFullPrev
        }
    }

    /**
     * @type {JET_BKINFO}
     */
    bkinfoIncPrev{
        get {
            if(!this.HasProp("__bkinfoIncPrev"))
                this.__bkinfoIncPrev := JET_BKINFO(this.ptr + 144)
            return this.__bkinfoIncPrev
        }
    }

    /**
     * @type {JET_BKINFO}
     */
    bkinfoFullCur{
        get {
            if(!this.HasProp("__bkinfoFullCur"))
                this.__bkinfoFullCur := JET_BKINFO(this.ptr + 168)
            return this.__bkinfoFullCur
        }
    }

    /**
     * @type {Integer}
     */
    fShadowingDisabled {
        get => NumGet(this, 192, "uint")
        set => NumPut("uint", value, this, 192)
    }

    /**
     * @type {Integer}
     */
    fUpgradeDb {
        get => NumGet(this, 196, "uint")
        set => NumPut("uint", value, this, 196)
    }

    /**
     * @type {Integer}
     */
    dwMajorVersion {
        get => NumGet(this, 200, "uint")
        set => NumPut("uint", value, this, 200)
    }

    /**
     * @type {Integer}
     */
    dwMinorVersion {
        get => NumGet(this, 204, "uint")
        set => NumPut("uint", value, this, 204)
    }

    /**
     * @type {Integer}
     */
    dwBuildNumber {
        get => NumGet(this, 208, "uint")
        set => NumPut("uint", value, this, 208)
    }

    /**
     * @type {Integer}
     */
    lSPNumber {
        get => NumGet(this, 212, "int")
        set => NumPut("int", value, this, 212)
    }

    /**
     * @type {Integer}
     */
    cbPageSize {
        get => NumGet(this, 216, "uint")
        set => NumPut("uint", value, this, 216)
    }

    /**
     * @type {Integer}
     */
    genMinRequired {
        get => NumGet(this, 220, "uint")
        set => NumPut("uint", value, this, 220)
    }

    /**
     * @type {Integer}
     */
    genMaxRequired {
        get => NumGet(this, 224, "uint")
        set => NumPut("uint", value, this, 224)
    }

    /**
     * @type {JET_LOGTIME}
     */
    logtimeGenMaxCreate{
        get {
            if(!this.HasProp("__logtimeGenMaxCreate"))
                this.__logtimeGenMaxCreate := JET_LOGTIME(this.ptr + 232)
            return this.__logtimeGenMaxCreate
        }
    }

    /**
     * @type {Integer}
     */
    ulRepairCount {
        get => NumGet(this, 240, "uint")
        set => NumPut("uint", value, this, 240)
    }

    /**
     * @type {JET_LOGTIME}
     */
    logtimeRepair{
        get {
            if(!this.HasProp("__logtimeRepair"))
                this.__logtimeRepair := JET_LOGTIME(this.ptr + 248)
            return this.__logtimeRepair
        }
    }

    /**
     * @type {Integer}
     */
    ulRepairCountOld {
        get => NumGet(this, 256, "uint")
        set => NumPut("uint", value, this, 256)
    }

    /**
     * @type {Integer}
     */
    ulECCFixSuccess {
        get => NumGet(this, 260, "uint")
        set => NumPut("uint", value, this, 260)
    }

    /**
     * @type {JET_LOGTIME}
     */
    logtimeECCFixSuccess{
        get {
            if(!this.HasProp("__logtimeECCFixSuccess"))
                this.__logtimeECCFixSuccess := JET_LOGTIME(this.ptr + 264)
            return this.__logtimeECCFixSuccess
        }
    }

    /**
     * @type {Integer}
     */
    ulECCFixSuccessOld {
        get => NumGet(this, 272, "uint")
        set => NumPut("uint", value, this, 272)
    }

    /**
     * @type {Integer}
     */
    ulECCFixFail {
        get => NumGet(this, 276, "uint")
        set => NumPut("uint", value, this, 276)
    }

    /**
     * @type {JET_LOGTIME}
     */
    logtimeECCFixFail{
        get {
            if(!this.HasProp("__logtimeECCFixFail"))
                this.__logtimeECCFixFail := JET_LOGTIME(this.ptr + 280)
            return this.__logtimeECCFixFail
        }
    }

    /**
     * @type {Integer}
     */
    ulECCFixFailOld {
        get => NumGet(this, 288, "uint")
        set => NumPut("uint", value, this, 288)
    }

    /**
     * @type {Integer}
     */
    ulBadChecksum {
        get => NumGet(this, 292, "uint")
        set => NumPut("uint", value, this, 292)
    }

    /**
     * @type {JET_LOGTIME}
     */
    logtimeBadChecksum{
        get {
            if(!this.HasProp("__logtimeBadChecksum"))
                this.__logtimeBadChecksum := JET_LOGTIME(this.ptr + 296)
            return this.__logtimeBadChecksum
        }
    }

    /**
     * @type {Integer}
     */
    ulBadChecksumOld {
        get => NumGet(this, 304, "uint")
        set => NumPut("uint", value, this, 304)
    }

    /**
     * @type {Integer}
     */
    genCommitted {
        get => NumGet(this, 308, "uint")
        set => NumPut("uint", value, this, 308)
    }
}
