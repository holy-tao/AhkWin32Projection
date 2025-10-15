#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SERVER_INFO_598 extends Win32Struct
{
    static sizeof => 176

    static packingSize => 8

    /**
     * @type {Integer}
     */
    sv598_maxrawworkitems {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    sv598_maxthreadsperqueue {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    sv598_producttype {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    sv598_serversize {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    sv598_connectionlessautodisc {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    sv598_sharingviolationretries {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    sv598_sharingviolationdelay {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    sv598_maxglobalopensearch {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    sv598_removeduplicatesearches {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    sv598_lockviolationoffset {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    sv598_lockviolationdelay {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    sv598_mdlreadswitchover {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    sv598_cachedopenlimit {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    sv598_otherqueueaffinity {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {BOOL}
     */
    sv598_restrictnullsessaccess{
        get {
            if(!this.HasProp("__sv598_restrictnullsessaccess"))
                this.__sv598_restrictnullsessaccess := BOOL(this.ptr + 56)
            return this.__sv598_restrictnullsessaccess
        }
    }

    /**
     * @type {BOOL}
     */
    sv598_enablewfw311directipx{
        get {
            if(!this.HasProp("__sv598_enablewfw311directipx"))
                this.__sv598_enablewfw311directipx := BOOL(this.ptr + 60)
            return this.__sv598_enablewfw311directipx
        }
    }

    /**
     * @type {Integer}
     */
    sv598_queuesamplesecs {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    sv598_balancecount {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    sv598_preferredaffinity {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    sv598_maxfreerfcbs {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * @type {Integer}
     */
    sv598_maxfreemfcbs {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    sv598_maxfreelfcbs {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * @type {Integer}
     */
    sv598_maxfreepagedpoolchunks {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    sv598_minpagedpoolchunksize {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * @type {Integer}
     */
    sv598_maxpagedpoolchunksize {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * @type {BOOL}
     */
    sv598_sendsfrompreferredprocessor{
        get {
            if(!this.HasProp("__sv598_sendsfrompreferredprocessor"))
                this.__sv598_sendsfrompreferredprocessor := BOOL(this.ptr + 100)
            return this.__sv598_sendsfrompreferredprocessor
        }
    }

    /**
     * @type {Integer}
     */
    sv598_cacheddirectorylimit {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    sv598_maxcopylength {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * @type {BOOL}
     */
    sv598_enablecompression{
        get {
            if(!this.HasProp("__sv598_enablecompression"))
                this.__sv598_enablecompression := BOOL(this.ptr + 112)
            return this.__sv598_enablecompression
        }
    }

    /**
     * @type {BOOL}
     */
    sv598_autosharewks{
        get {
            if(!this.HasProp("__sv598_autosharewks"))
                this.__sv598_autosharewks := BOOL(this.ptr + 116)
            return this.__sv598_autosharewks
        }
    }

    /**
     * @type {BOOL}
     */
    sv598_autoshareserver{
        get {
            if(!this.HasProp("__sv598_autoshareserver"))
                this.__sv598_autoshareserver := BOOL(this.ptr + 120)
            return this.__sv598_autoshareserver
        }
    }

    /**
     * @type {BOOL}
     */
    sv598_enablesecuritysignature{
        get {
            if(!this.HasProp("__sv598_enablesecuritysignature"))
                this.__sv598_enablesecuritysignature := BOOL(this.ptr + 124)
            return this.__sv598_enablesecuritysignature
        }
    }

    /**
     * @type {BOOL}
     */
    sv598_requiresecuritysignature{
        get {
            if(!this.HasProp("__sv598_requiresecuritysignature"))
                this.__sv598_requiresecuritysignature := BOOL(this.ptr + 128)
            return this.__sv598_requiresecuritysignature
        }
    }

    /**
     * @type {Integer}
     */
    sv598_minclientbuffersize {
        get => NumGet(this, 132, "uint")
        set => NumPut("uint", value, this, 132)
    }

    /**
     * @type {Pointer<Guid>}
     */
    sv598_serverguid {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * @type {Integer}
     */
    sv598_ConnectionNoSessionsTimeout {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }

    /**
     * @type {Integer}
     */
    sv598_IdleThreadTimeOut {
        get => NumGet(this, 148, "uint")
        set => NumPut("uint", value, this, 148)
    }

    /**
     * @type {BOOL}
     */
    sv598_enableW9xsecuritysignature{
        get {
            if(!this.HasProp("__sv598_enableW9xsecuritysignature"))
                this.__sv598_enableW9xsecuritysignature := BOOL(this.ptr + 152)
            return this.__sv598_enableW9xsecuritysignature
        }
    }

    /**
     * @type {BOOL}
     */
    sv598_enforcekerberosreauthentication{
        get {
            if(!this.HasProp("__sv598_enforcekerberosreauthentication"))
                this.__sv598_enforcekerberosreauthentication := BOOL(this.ptr + 156)
            return this.__sv598_enforcekerberosreauthentication
        }
    }

    /**
     * @type {BOOL}
     */
    sv598_disabledos{
        get {
            if(!this.HasProp("__sv598_disabledos"))
                this.__sv598_disabledos := BOOL(this.ptr + 160)
            return this.__sv598_disabledos
        }
    }

    /**
     * @type {Integer}
     */
    sv598_lowdiskspaceminimum {
        get => NumGet(this, 164, "uint")
        set => NumPut("uint", value, this, 164)
    }

    /**
     * @type {BOOL}
     */
    sv598_disablestrictnamechecking{
        get {
            if(!this.HasProp("__sv598_disablestrictnamechecking"))
                this.__sv598_disablestrictnamechecking := BOOL(this.ptr + 168)
            return this.__sv598_disablestrictnamechecking
        }
    }

    /**
     * @type {BOOL}
     */
    sv598_enableauthenticateusersharing{
        get {
            if(!this.HasProp("__sv598_enableauthenticateusersharing"))
                this.__sv598_enableauthenticateusersharing := BOOL(this.ptr + 172)
            return this.__sv598_enableauthenticateusersharing
        }
    }
}
