#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DS_REPL_OP_TYPE.ahk" { DS_REPL_OP_TYPE }

/**
 * The DS_REPL_OPW_BLOB structure describes a replication task currently executing or pending execution.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/ns-ntdsapi-ds_repl_opw_blob
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct DS_REPL_OPW_BLOB {
    #StructPack 4

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the date and time that this operation was added to the queue.
     */
    ftimeEnqueued : FILETIME

    /**
     * Contains the identifier of the operation. This value is unique  in the startup routine of every computer. When the computer is restarted, the identifiers are no longer unique.
     */
    ulSerialNumber : UInt32

    /**
     * Contains the priority value of this operation. Tasks with a higher priority value are executed first. The priority is calculated by the server based on the type of operation and its parameters.
     */
    ulPriority : UInt32

    /**
     * Contains one of the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ne-ntdsapi-ds_repl_op_type">DS_REPL_OP_TYPE</a> values that indicate the type of operation that this structure represents.
     */
    OpType : DS_REPL_OP_TYPE

    /**
     * Zero or more bits, the interpretation of which depends on the <b>OpType</b>. For <b>DS_REPL_OP_TYPE_SYNC</b>, the bits should be interpreted as <b>DS_REPSYNC_*</b>. <b>ADD</b>, <b>DELETE</b>, <b>MODIFY</b>, and <b>UPDATE_REFS</b> use <b>DS_REPADD_*</b>, <b>DS_REPDEL_*</b>, <b>DS_REPMOD_*</b>, and <b>DS_REPUPD_*</b>. For more information, and descriptions of these bits, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsreplicasynca">DsReplicaSync</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsreplicaadda">DsReplicaAdd</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsreplicadela">DsReplicaDel</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsreplicamodifya">DsReplicaModify</a>, and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsreplicaupdaterefsa">DsReplicaUpdateRefs</a>.
     * 
     * Contains a set of flags that provide additional data about the operation. The contents of this member is determined by the contents of the <b>OpType</b> member.
     * 
     * 
     * This list describes the contents of the <i>ulOptions</i> parameter for each <i>OpType</i> value.
     */
    ulOptions : UInt32

    /**
     * Contains the offset, in bytes, from the address of this structure  to  a null-terminated string that contains the distinguished name of the naming context associated with this operation. For example, the naming context to be synchronized for <b>DS_REPL_OP_TYPE_SYNC</b>.
     */
    oszNamingContext : UInt32

    /**
     * Contains the offset, in bytes, from the address of this structure  to  a null-terminated string that contains the distinguished name of the directory system agent object associated with the remote server corresponding to this operation. For example, the server from which to ask for changes for <b>DS_REPL_OP_TYPE_SYNC</b>. This can be  <b>NULL</b>.
     */
    oszDsaDN : UInt32

    /**
     * Contains the offset, in bytes, from the address of this structure  to  a null-terminated string that contains the transport-specific network address of the remote server associated with this operation. For example, the DNS or SMTP address of the server from which to ask for changes for <b>DS_REPL_OP_TYPE_SYNC</b>. This can be  <b>NULL</b>.
     */
    oszDsaAddress : UInt32

    /**
     * Contains the <b>objectGuid</b> of the naming context identified by <b>pszNamingContext</b>.
     */
    uuidNamingContextObjGuid : Guid

    /**
     * Contains the <b>objectGuid</b> of the directory system agent object identified by <b>pszDsaDN</b>.
     */
    uuidDsaObjGuid : Guid

}
