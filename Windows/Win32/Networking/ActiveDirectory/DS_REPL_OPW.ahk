#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The DS_REPL_OP structure describes a replication task currently executing or pending execution, as returned by the DsReplicaGetInfo or DsReplicaGetInfo2 function.
 * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/ns-ntdsapi-ds_repl_opw
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DS_REPL_OPW extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the date and time that this operation was added to the queue.
     * @type {FILETIME}
     */
    ftimeEnqueued{
        get {
            if(!this.HasProp("__ftimeEnqueued"))
                this.__ftimeEnqueued := FILETIME(this.ptr + 0)
            return this.__ftimeEnqueued
        }
    }

    /**
     * Contains the operation identifier. This value is unique  in the startup routine of every computer. When the computer is restarted, the identifiers are no longer unique.
     * @type {Integer}
     */
    ulSerialNumber {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Contains the priority value of this operation. Tasks with a higher priority value are executed first. The priority is calculated by the server based on the type of operation and its parameters.
     * @type {Integer}
     */
    ulPriority {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Contains one of the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ne-ntdsapi-ds_repl_op_type">DS_REPL_OP_TYPE</a> values that indicate the type of operation that this structure represents.
     * @type {Integer}
     */
    OpType {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Zero or more bits, the interpretation of which depends on the <b>OpType</b>. For <b>DS_REPL_OP_TYPE_SYNC</b>, the bits should be interpreted as <b>DS_REPSYNC_*</b>. <b>ADD</b>, <b>DELETE</b>, <b>MODIFY</b>, and <b>UPDATE_REFS</b> use <b>DS_REPADD_*</b>, <b>DS_REPDEL_*</b>, <b>DS_REPMOD_*</b>, and <b>DS_REPUPD_*</b>. For more information and descriptions of these bits, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsreplicasynca">DsReplicaSync</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsreplicaadda">DsReplicaAdd</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsreplicadela">DsReplicaDel</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsreplicamodifya">DsReplicaModify</a>, and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsreplicaupdaterefsa">DsReplicaUpdateRefs</a>.
     * 
     * Contains a set of flags that provides additional data about the operation. The contents of this member is determined by the contents of the <b>OpType</b> member.
     * @type {Integer}
     */
    ulOptions {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Pointer to a null-terminated string that contains the distinguished name of the naming context associated with this operation. For example, the naming context to be synchronized for <b>DS_REPL_OP_TYPE_SYNC</b>.
     * @type {PWSTR}
     */
    pszNamingContext{
        get {
            if(!this.HasProp("__pszNamingContext"))
                this.__pszNamingContext := PWSTR(this.ptr + 24)
            return this.__pszNamingContext
        }
    }

    /**
     * Pointer to a null-terminated string that contains the distinguished name of the directory system agent object associated with the remote server corresponding to this operation. For example, the server from which to request changes for <b>DS_REPL_OP_TYPE_SYNC</b>. This can be  <b>NULL</b>.
     * @type {PWSTR}
     */
    pszDsaDN{
        get {
            if(!this.HasProp("__pszDsaDN"))
                this.__pszDsaDN := PWSTR(this.ptr + 32)
            return this.__pszDsaDN
        }
    }

    /**
     * Pointer to a null-terminated string that contains the transport-specific network address of the remote server associated with this operation. For example, the DNS or SMTP address of the server from which to request changes for <b>DS_REPL_OP_TYPE_SYNC</b>. This can be  <b>NULL</b>.
     * @type {PWSTR}
     */
    pszDsaAddress{
        get {
            if(!this.HasProp("__pszDsaAddress"))
                this.__pszDsaAddress := PWSTR(this.ptr + 40)
            return this.__pszDsaAddress
        }
    }

    /**
     * Contains the <b>objectGuid</b> of the naming context identified by <b>pszNamingContext</b>.
     * @type {Pointer<Guid>}
     */
    uuidNamingContextObjGuid {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Contains the <b>objectGuid</b> of the directory system agent object identified by <b>pszDsaDN</b>.
     * @type {Pointer<Guid>}
     */
    uuidDsaObjGuid {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
