#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import ".\DS_REPL_KCC_DSA_FAILUREW.ahk" { DS_REPL_KCC_DSA_FAILUREW }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The DS_REPL_KCC_DSA_FAILURES structure contains an array of DS_REPL_KCC_DSA_FAILURE structures, which in turn contain replication state data with respect to inbound replication partners, as returned by the DsReplicaGetInfo and DsReplicaGetInfo2 functions.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/ns-ntdsapi-ds_repl_kcc_dsa_failuresw
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct DS_REPL_KCC_DSA_FAILURESW {
    #StructPack 8

    /**
     * Contains the number of elements in the <b>rgMetaData</b> array.
     */
    cNumEntries : UInt32

    /**
     * Reserved for future use.
     */
    dwReserved : UInt32

    /**
     * Contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_repl_kcc_dsa_failurew">DS_REPL_KCC_DSA_FAILURE</a> structures that contain the requested replication data. The <b>cNumEntries</b> member contains the number of elements in this array.
     */
    rgDsaFailure : DS_REPL_KCC_DSA_FAILUREW[1]

}
