#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The DS_REPL_CURSOR_2 structure contains inbound replication state data with respect to all replicas of a given naming context, as returned by the DsReplicaGetInfo2 function. This structure is an enhanced version of the DS_REPL_CURSOR structure.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/ns-ntdsapi-ds_repl_cursor_2
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct DS_REPL_CURSOR_2 {
    #StructPack 8

    /**
     * Contains the invocation identifier of the originating server to which the <b>usnAttributeFilter</b> corresponds.
     */
    uuidSourceDsaInvocationID : Guid

    /**
     * Contains the maximum update sequence number to which the destination server can indicate that it has recorded all changes originated by the given server at update sequence numbers less than, or equal to, this update sequence number. This is used to filter changes at replication source servers that the destination server has already applied.
     */
    usnAttributeFilter : Int64

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the date and time of the last successful synchronization operation.
     */
    ftimeLastSyncSuccess : FILETIME

}
