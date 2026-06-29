#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains inbound replication state data for a particular naming context and source server pair, as returned by the DsReplicaGetInfo and DsReplicaGetInfo2 functions.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/ns-ntdsapi-ds_repl_neighborw
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct DS_REPL_NEIGHBORW {
    #StructPack 8

    /**
     * Pointer to a null-terminated string that contains the naming context to which this replication state data pertains. Each naming context is replicated independently and has different associated neighbor data, even if the naming contexts are replicated from the same source server.
     */
    pszNamingContext : PWSTR

    /**
     * Pointer to  a null-terminated string that contains the distinguished name of the directory service agent corresponding to the source server to which this replication state data pertains.  Each source server has different associated neighbor data.
     */
    pszSourceDsaDN : PWSTR

    /**
     * Pointer to  a null-terminated string that contains the transport-specific network address of the source server. That is, a directory name service name for RPC/IP replication, or an SMTP address for an SMTP replication.
     */
    pszSourceDsaAddress : PWSTR

    /**
     * Pointer to  a null-terminated string that contains the distinguished name of the <b>interSiteTransport</b> object that corresponds to the transport over which replication is performed. This member contains <b>NULL</b> for RPC/IP replication.
     */
    pszAsyncIntersiteTransportDN : PWSTR

    /**
     * Contains a set of flags that specify attributes and options for the replication data. This can be zero or a combination of one or more of the following flags.
     */
    dwReplicaFlags : UInt32

    /**
     * Reserved for future use.
     */
    dwReserved : UInt32

    /**
     * Contains the <b>objectGuid</b> of the naming context corresponding to <b>pszNamingContext</b>.
     */
    uuidNamingContextObjGuid : Guid

    /**
     * Contains the <b>objectGuid</b> of the <b>nTDSDSA</b> object corresponding to <b>pszSourceDsaDN</b>.
     */
    uuidSourceDsaObjGuid : Guid

    /**
     * Contains the invocation identifier used by the source server as of the last replication attempt.
     */
    uuidSourceDsaInvocationID : Guid

    /**
     * Contains the <b>objectGuid</b> of the inter-site transport object corresponding to <b>pszAsyncIntersiteTransportDN</b>.
     */
    uuidAsyncIntersiteTransportObjGuid : Guid

    /**
     * Contains the update sequence number of the last object update received.
     */
    usnLastObjChangeSynced : Int64

    /**
     * Contains the <b>usnLastObjChangeSynced</b> value at the end of the last complete, successful replication cycle, or 0 if none. Attributes at the source last updated at a update sequence number less than or equal to this value have already been received and applied by the destination.
     */
    usnAttributeFilter : Int64

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the date and time the last successful replication cycle was completed from this source. All members of this structure are zero if the replication cycle has never been completed.
     */
    ftimeLastSyncSuccess : FILETIME

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the date and time of the last replication attempt from this source. All members of this structure are zero if the replication  has never been attempted.
     */
    ftimeLastSyncAttempt : FILETIME

    /**
     * Contains an error code associated with the last replication attempt from this source. Contains <b>ERROR_SUCCESS</b> if the last attempt succeeded.
     */
    dwLastSyncResult : UInt32

    /**
     * Contains the number of failed replication attempts from this source since the last successful replication attempt - or since the source was added as a neighbor, if no previous attempt was successful.
     */
    cNumConsecutiveSyncFailures : UInt32

}
