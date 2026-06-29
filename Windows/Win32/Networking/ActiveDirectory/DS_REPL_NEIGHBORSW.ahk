#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import ".\DS_REPL_NEIGHBORW.ahk" { DS_REPL_NEIGHBORW }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The DS_REPL_NEIGHBORS structure is used with the DsReplicaGetInfo and DsReplicaGetInfo2 functions to provide inbound replication state data for naming context and source server pairs.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/ns-ntdsapi-ds_repl_neighborsw
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct DS_REPL_NEIGHBORSW {
    #StructPack 8

    /**
     * Contains  the number of elements in the <b>rgNeighbor</b> array.
     */
    cNumNeighbors : UInt32

    /**
     * Reserved for future use.
     */
    dwReserved : UInt32

    /**
     * Contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_repl_neighborw">DS_REPL_NEIGHBOR</a> structures that contain the requested replication data. The <b>cNumNeighbors</b> member contains the number of elements in this array.
     */
    rgNeighbor : DS_REPL_NEIGHBORW[1]

}
