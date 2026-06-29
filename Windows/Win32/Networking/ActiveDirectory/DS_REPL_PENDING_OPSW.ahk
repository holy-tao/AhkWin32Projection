#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DS_REPL_OPW.ahk" { DS_REPL_OPW }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DS_REPL_OP_TYPE.ahk" { DS_REPL_OP_TYPE }

/**
 * Contains an array of DS_REPL_OP structures, which in turn describe the replication tasks currently executing and queued to execute, as returned by the DsReplicaGetInfo and DsReplicaGetInfo2 functions.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/ns-ntdsapi-ds_repl_pending_opsw
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct DS_REPL_PENDING_OPSW {
    #StructPack 8

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the date and time at which the first operation in the queue began executing.
     */
    ftimeCurrentOpStarted : FILETIME

    /**
     * Contains the number of elements in the <b>rgPendingOps</b> array.
     */
    cNumPendingOps : UInt32

    /**
     * Contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_repl_opw">DS_REPL_OP</a> structures that contain the replication tasks currently executing and queued to execute.
     */
    rgPendingOp : DS_REPL_OPW[1]

}
