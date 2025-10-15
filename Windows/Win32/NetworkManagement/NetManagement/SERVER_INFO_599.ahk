#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SERVER_INFO_599 extends Win32Struct
{
    static sizeof => 232

    static packingSize => 8

    /**
     * @type {Integer}
     */
    sv599_sessopens {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    sv599_sessvcs {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    sv599_opensearch {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    sv599_sizreqbuf {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    sv599_initworkitems {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    sv599_maxworkitems {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    sv599_rawworkitems {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    sv599_irpstacksize {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    sv599_maxrawbuflen {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    sv599_sessusers {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    sv599_sessconns {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    sv599_maxpagedmemoryusage {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    sv599_maxnonpagedmemoryusage {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {BOOL}
     */
    sv599_enablesoftcompat{
        get {
            if(!this.HasProp("__sv599_enablesoftcompat"))
                this.__sv599_enablesoftcompat := BOOL(this.ptr + 52)
            return this.__sv599_enablesoftcompat
        }
    }

    /**
     * @type {BOOL}
     */
    sv599_enableforcedlogoff{
        get {
            if(!this.HasProp("__sv599_enableforcedlogoff"))
                this.__sv599_enableforcedlogoff := BOOL(this.ptr + 56)
            return this.__sv599_enableforcedlogoff
        }
    }

    /**
     * @type {BOOL}
     */
    sv599_timesource{
        get {
            if(!this.HasProp("__sv599_timesource"))
                this.__sv599_timesource := BOOL(this.ptr + 60)
            return this.__sv599_timesource
        }
    }

    /**
     * @type {BOOL}
     */
    sv599_acceptdownlevelapis{
        get {
            if(!this.HasProp("__sv599_acceptdownlevelapis"))
                this.__sv599_acceptdownlevelapis := BOOL(this.ptr + 64)
            return this.__sv599_acceptdownlevelapis
        }
    }

    /**
     * @type {BOOL}
     */
    sv599_lmannounce{
        get {
            if(!this.HasProp("__sv599_lmannounce"))
                this.__sv599_lmannounce := BOOL(this.ptr + 68)
            return this.__sv599_lmannounce
        }
    }

    /**
     * @type {PWSTR}
     */
    sv599_domain{
        get {
            if(!this.HasProp("__sv599_domain"))
                this.__sv599_domain := PWSTR(this.ptr + 72)
            return this.__sv599_domain
        }
    }

    /**
     * @type {Integer}
     */
    sv599_maxcopyreadlen {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    sv599_maxcopywritelen {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * @type {Integer}
     */
    sv599_minkeepsearch {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    sv599_maxkeepsearch {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * @type {Integer}
     */
    sv599_minkeepcomplsearch {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    sv599_maxkeepcomplsearch {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * @type {Integer}
     */
    sv599_threadcountadd {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    sv599_numblockthreads {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * @type {Integer}
     */
    sv599_scavtimeout {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * @type {Integer}
     */
    sv599_minrcvqueue {
        get => NumGet(this, 116, "uint")
        set => NumPut("uint", value, this, 116)
    }

    /**
     * @type {Integer}
     */
    sv599_minfreeworkitems {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * @type {Integer}
     */
    sv599_xactmemsize {
        get => NumGet(this, 124, "uint")
        set => NumPut("uint", value, this, 124)
    }

    /**
     * @type {Integer}
     */
    sv599_threadpriority {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * @type {Integer}
     */
    sv599_maxmpxct {
        get => NumGet(this, 132, "uint")
        set => NumPut("uint", value, this, 132)
    }

    /**
     * @type {Integer}
     */
    sv599_oplockbreakwait {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * @type {Integer}
     */
    sv599_oplockbreakresponsewait {
        get => NumGet(this, 140, "uint")
        set => NumPut("uint", value, this, 140)
    }

    /**
     * @type {BOOL}
     */
    sv599_enableoplocks{
        get {
            if(!this.HasProp("__sv599_enableoplocks"))
                this.__sv599_enableoplocks := BOOL(this.ptr + 144)
            return this.__sv599_enableoplocks
        }
    }

    /**
     * @type {BOOL}
     */
    sv599_enableoplockforceclose{
        get {
            if(!this.HasProp("__sv599_enableoplockforceclose"))
                this.__sv599_enableoplockforceclose := BOOL(this.ptr + 148)
            return this.__sv599_enableoplockforceclose
        }
    }

    /**
     * @type {BOOL}
     */
    sv599_enablefcbopens{
        get {
            if(!this.HasProp("__sv599_enablefcbopens"))
                this.__sv599_enablefcbopens := BOOL(this.ptr + 152)
            return this.__sv599_enablefcbopens
        }
    }

    /**
     * @type {BOOL}
     */
    sv599_enableraw{
        get {
            if(!this.HasProp("__sv599_enableraw"))
                this.__sv599_enableraw := BOOL(this.ptr + 156)
            return this.__sv599_enableraw
        }
    }

    /**
     * @type {BOOL}
     */
    sv599_enablesharednetdrives{
        get {
            if(!this.HasProp("__sv599_enablesharednetdrives"))
                this.__sv599_enablesharednetdrives := BOOL(this.ptr + 160)
            return this.__sv599_enablesharednetdrives
        }
    }

    /**
     * @type {Integer}
     */
    sv599_minfreeconnections {
        get => NumGet(this, 164, "uint")
        set => NumPut("uint", value, this, 164)
    }

    /**
     * @type {Integer}
     */
    sv599_maxfreeconnections {
        get => NumGet(this, 168, "uint")
        set => NumPut("uint", value, this, 168)
    }

    /**
     * @type {Integer}
     */
    sv599_initsesstable {
        get => NumGet(this, 172, "uint")
        set => NumPut("uint", value, this, 172)
    }

    /**
     * @type {Integer}
     */
    sv599_initconntable {
        get => NumGet(this, 176, "uint")
        set => NumPut("uint", value, this, 176)
    }

    /**
     * @type {Integer}
     */
    sv599_initfiletable {
        get => NumGet(this, 180, "uint")
        set => NumPut("uint", value, this, 180)
    }

    /**
     * @type {Integer}
     */
    sv599_initsearchtable {
        get => NumGet(this, 184, "uint")
        set => NumPut("uint", value, this, 184)
    }

    /**
     * @type {Integer}
     */
    sv599_alertschedule {
        get => NumGet(this, 188, "uint")
        set => NumPut("uint", value, this, 188)
    }

    /**
     * @type {Integer}
     */
    sv599_errorthreshold {
        get => NumGet(this, 192, "uint")
        set => NumPut("uint", value, this, 192)
    }

    /**
     * @type {Integer}
     */
    sv599_networkerrorthreshold {
        get => NumGet(this, 196, "uint")
        set => NumPut("uint", value, this, 196)
    }

    /**
     * @type {Integer}
     */
    sv599_diskspacethreshold {
        get => NumGet(this, 200, "uint")
        set => NumPut("uint", value, this, 200)
    }

    /**
     * @type {Integer}
     */
    sv599_reserved {
        get => NumGet(this, 204, "uint")
        set => NumPut("uint", value, this, 204)
    }

    /**
     * @type {Integer}
     */
    sv599_maxlinkdelay {
        get => NumGet(this, 208, "uint")
        set => NumPut("uint", value, this, 208)
    }

    /**
     * @type {Integer}
     */
    sv599_minlinkthroughput {
        get => NumGet(this, 212, "uint")
        set => NumPut("uint", value, this, 212)
    }

    /**
     * @type {Integer}
     */
    sv599_linkinfovalidtime {
        get => NumGet(this, 216, "uint")
        set => NumPut("uint", value, this, 216)
    }

    /**
     * @type {Integer}
     */
    sv599_scavqosinfoupdatetime {
        get => NumGet(this, 220, "uint")
        set => NumPut("uint", value, this, 220)
    }

    /**
     * @type {Integer}
     */
    sv599_maxworkitemidletime {
        get => NumGet(this, 224, "uint")
        set => NumPut("uint", value, this, 224)
    }
}
