#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DS_REPL_CURSOR_3W.ahk" { DS_REPL_CURSOR_3W }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The DS_REPL_CURSORS_3 structure is used with the DsReplicaGetInfo2 function to provide replication state data with respect to all replicas of a given naming context.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/ns-ntdsapi-ds_repl_cursors_3w
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct DS_REPL_CURSORS_3W {
    #StructPack 8

    /**
     * Contains  the number of elements in the <b>rgCursor</b> array.
     */
    cNumCursors : UInt32

    /**
     * Contains the zero-based index of the next entry to retrieve if more entries are available. This value is passed for the <i>dwEnumerationContext</i> parameter in the next call to <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsreplicagetinfo2w">DsReplicaGetInfo2</a> to retrieve the next block of entries. If no more entries are available, this member contains -1.
     */
    dwEnumerationContext : UInt32

    /**
     * Contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_repl_cursor_3w">DS_REPL_CURSOR_3</a> structures that contain the requested replication data. The <b>cNumCursors</b> member contains the number of elements in this array.
     */
    rgCursor : DS_REPL_CURSOR_3W[1]

}
