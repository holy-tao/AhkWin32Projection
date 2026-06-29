#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DS_REPL_CURSOR.ahk" { DS_REPL_CURSOR }

/**
 * The DS_REPL_CURSORS structure is used with the DsReplicaGetInfo and DsReplicaGetInfo2 function to provide replication state data with respect to all replicas of a given naming context.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/ns-ntdsapi-ds_repl_cursors
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct DS_REPL_CURSORS {
    #StructPack 8

    /**
     * Contains  the number of elements in the <b>rgCursor</b> array.
     */
    cNumCursors : UInt32

    /**
     * Reserved for future use.
     */
    dwReserved : UInt32

    /**
     * Contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_repl_cursor">DS_REPL_CURSOR</a> structures that contain the requested replication data. The <b>cNumCursors</b> member contains the number of elements in this array.
     */
    rgCursor : DS_REPL_CURSOR[1]

}
