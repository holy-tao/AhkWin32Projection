#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The DS_REPL_KCC_DSA_FAILURE structure contains replication state data about a specific inbound replication partner, as returned by the DsReplicaGetInfo and DsReplicaGetInfo2 function.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/ns-ntdsapi-ds_repl_kcc_dsa_failurew
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct DS_REPL_KCC_DSA_FAILUREW {
    #StructPack 8

    /**
     * Pointer to a null-terminated string that contains the  distinguished name of the directory system agent object in the directory that corresponds to the source server.
     */
    pszDsaDN : PWSTR

    /**
     * Contains the <b>objectGuid</b> of the directory system agent object represented by the <b>pszDsaDN</b> member.
     */
    uuidDsaObjGuid : Guid

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure which the contents of depends on the value passed for the <i>InfoType</i> parameter when <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsreplicagetinfow">DsReplicaGetInfo</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsreplicagetinfo2w">DsReplicaGetInfo2</a> function was called.
     */
    ftimeFirstFailure : FILETIME

    /**
     * Contains the number of consecutive failures since the last successful replication.
     */
    cNumFailures : UInt32

    /**
     * Contains the error code associated with the most recent failure, or <b>ERROR_SUCCESS</b> if the specific error is unavailable.
     */
    dwLastResult : UInt32

}
