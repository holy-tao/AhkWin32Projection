#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
    sv598_restrictnullsessaccess {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * @type {BOOL}
     */
    sv598_enablewfw311directipx {
        get => NumGet(this, 60, "int")
        set => NumPut("int", value, this, 60)
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
    sv598_sendsfrompreferredprocessor {
        get => NumGet(this, 100, "int")
        set => NumPut("int", value, this, 100)
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
    sv598_enablecompression {
        get => NumGet(this, 112, "int")
        set => NumPut("int", value, this, 112)
    }

    /**
     * @type {BOOL}
     */
    sv598_autosharewks {
        get => NumGet(this, 116, "int")
        set => NumPut("int", value, this, 116)
    }

    /**
     * @type {BOOL}
     */
    sv598_autoshareserver {
        get => NumGet(this, 120, "int")
        set => NumPut("int", value, this, 120)
    }

    /**
     * @type {BOOL}
     */
    sv598_enablesecuritysignature {
        get => NumGet(this, 124, "int")
        set => NumPut("int", value, this, 124)
    }

    /**
     * @type {BOOL}
     */
    sv598_requiresecuritysignature {
        get => NumGet(this, 128, "int")
        set => NumPut("int", value, this, 128)
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
    sv598_enableW9xsecuritysignature {
        get => NumGet(this, 152, "int")
        set => NumPut("int", value, this, 152)
    }

    /**
     * @type {BOOL}
     */
    sv598_enforcekerberosreauthentication {
        get => NumGet(this, 156, "int")
        set => NumPut("int", value, this, 156)
    }

    /**
     * @type {BOOL}
     */
    sv598_disabledos {
        get => NumGet(this, 160, "int")
        set => NumPut("int", value, this, 160)
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
    sv598_disablestrictnamechecking {
        get => NumGet(this, 168, "int")
        set => NumPut("int", value, this, 168)
    }

    /**
     * @type {BOOL}
     */
    sv598_enableauthenticateusersharing {
        get => NumGet(this, 172, "int")
        set => NumPut("int", value, this, 172)
    }
}
