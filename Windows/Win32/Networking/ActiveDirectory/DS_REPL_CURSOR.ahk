#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The DS_REPL_CURSOR structure contains inbound replication state data with respect to all replicas of a given naming context, as returned by the DsReplicaGetInfo and DsReplicaGetInfo2 functions.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/ns-ntdsapi-ds_repl_cursor
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct DS_REPL_CURSOR {
    #StructPack 8

    /**
     * Contains the invocation identifier of the originating server to which the <b>usnAttributeFilter</b> corresponds.
     */
    uuidSourceDsaInvocationID : Guid

    /**
     * Contains the maximum update sequence number to which the destination server can indicate that it has recorded all changes originated by the given server at update sequence numbers less than, or equal to, this update sequence number. This is used to filter changes at replication source servers that the destination server has already applied.
     */
    usnAttributeFilter : Int64

}
