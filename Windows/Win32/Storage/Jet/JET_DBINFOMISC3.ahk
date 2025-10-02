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
    static sizeof => 320

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
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {JET_LGPOS}
     */
    lgposConsistent{
        get {
            if(!this.HasProp("__lgposConsistent"))
                this.__lgposConsistent := JET_LGPOS(this.ptr + 48)
            return this.__lgposConsistent
        }
    }

    /**
     * @type {JET_LOGTIME}
     */
    logtimeConsistent{
        get {
            if(!this.HasProp("__logtimeConsistent"))
                this.__logtimeConsistent := JET_LOGTIME(this.ptr + 56)
            return this.__logtimeConsistent
        }
    }

    /**
     * @type {JET_LOGTIME}
     */
    logtimeAttach{
        get {
            if(!this.HasProp("__logtimeAttach"))
                this.__logtimeAttach := JET_LOGTIME(this.ptr + 64)
            return this.__logtimeAttach
        }
    }

    /**
     * @type {JET_LGPOS}
     */
    lgposAttach{
        get {
            if(!this.HasProp("__lgposAttach"))
                this.__lgposAttach := JET_LGPOS(this.ptr + 72)
            return this.__lgposAttach
        }
    }

    /**
     * @type {JET_LOGTIME}
     */
    logtimeDetach{
        get {
            if(!this.HasProp("__logtimeDetach"))
                this.__logtimeDetach := JET_LOGTIME(this.ptr + 80)
            return this.__logtimeDetach
        }
    }

    /**
     * @type {JET_LGPOS}
     */
    lgposDetach{
        get {
            if(!this.HasProp("__lgposDetach"))
                this.__lgposDetach := JET_LGPOS(this.ptr + 88)
            return this.__lgposDetach
        }
    }

    /**
     * @type {JET_SIGNATURE}
     */
    signLog{
        get {
            if(!this.HasProp("__signLog"))
                this.__signLog := JET_SIGNATURE(this.ptr + 96)
            return this.__signLog
        }
    }

    /**
     * @type {JET_BKINFO}
     */
    bkinfoFullPrev{
        get {
            if(!this.HasProp("__bkinfoFullPrev"))
                this.__bkinfoFullPrev := JET_BKINFO(this.ptr + 128)
            return this.__bkinfoFullPrev
        }
    }

    /**
     * @type {JET_BKINFO}
     */
    bkinfoIncPrev{
        get {
            if(!this.HasProp("__bkinfoIncPrev"))
                this.__bkinfoIncPrev := JET_BKINFO(this.ptr + 152)
            return this.__bkinfoIncPrev
        }
    }

    /**
     * @type {JET_BKINFO}
     */
    bkinfoFullCur{
        get {
            if(!this.HasProp("__bkinfoFullCur"))
                this.__bkinfoFullCur := JET_BKINFO(this.ptr + 176)
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

    /**
     * @type {Integer}
     */
    genMinRequired {
        get => NumGet(this, 228, "uint")
        set => NumPut("uint", value, this, 228)
    }

    /**
     * @type {Integer}
     */
    genMaxRequired {
        get => NumGet(this, 232, "uint")
        set => NumPut("uint", value, this, 232)
    }

    /**
     * @type {JET_LOGTIME}
     */
    logtimeGenMaxCreate{
        get {
            if(!this.HasProp("__logtimeGenMaxCreate"))
                this.__logtimeGenMaxCreate := JET_LOGTIME(this.ptr + 240)
            return this.__logtimeGenMaxCreate
        }
    }

    /**
     * @type {Integer}
     */
    ulRepairCount {
        get => NumGet(this, 248, "uint")
        set => NumPut("uint", value, this, 248)
    }

    /**
     * @type {JET_LOGTIME}
     */
    logtimeRepair{
        get {
            if(!this.HasProp("__logtimeRepair"))
                this.__logtimeRepair := JET_LOGTIME(this.ptr + 256)
            return this.__logtimeRepair
        }
    }

    /**
     * @type {Integer}
     */
    ulRepairCountOld {
        get => NumGet(this, 264, "uint")
        set => NumPut("uint", value, this, 264)
    }

    /**
     * @type {Integer}
     */
    ulECCFixSuccess {
        get => NumGet(this, 268, "uint")
        set => NumPut("uint", value, this, 268)
    }

    /**
     * @type {JET_LOGTIME}
     */
    logtimeECCFixSuccess{
        get {
            if(!this.HasProp("__logtimeECCFixSuccess"))
                this.__logtimeECCFixSuccess := JET_LOGTIME(this.ptr + 272)
            return this.__logtimeECCFixSuccess
        }
    }

    /**
     * @type {Integer}
     */
    ulECCFixSuccessOld {
        get => NumGet(this, 280, "uint")
        set => NumPut("uint", value, this, 280)
    }

    /**
     * @type {Integer}
     */
    ulECCFixFail {
        get => NumGet(this, 284, "uint")
        set => NumPut("uint", value, this, 284)
    }

    /**
     * @type {JET_LOGTIME}
     */
    logtimeECCFixFail{
        get {
            if(!this.HasProp("__logtimeECCFixFail"))
                this.__logtimeECCFixFail := JET_LOGTIME(this.ptr + 288)
            return this.__logtimeECCFixFail
        }
    }

    /**
     * @type {Integer}
     */
    ulECCFixFailOld {
        get => NumGet(this, 296, "uint")
        set => NumPut("uint", value, this, 296)
    }

    /**
     * @type {Integer}
     */
    ulBadChecksum {
        get => NumGet(this, 300, "uint")
        set => NumPut("uint", value, this, 300)
    }

    /**
     * @type {JET_LOGTIME}
     */
    logtimeBadChecksum{
        get {
            if(!this.HasProp("__logtimeBadChecksum"))
                this.__logtimeBadChecksum := JET_LOGTIME(this.ptr + 304)
            return this.__logtimeBadChecksum
        }
    }

    /**
     * @type {Integer}
     */
    ulBadChecksumOld {
        get => NumGet(this, 312, "uint")
        set => NumPut("uint", value, this, 312)
    }

    /**
     * @type {Integer}
     */
    genCommitted {
        get => NumGet(this, 316, "uint")
        set => NumPut("uint", value, this, 316)
    }
}
