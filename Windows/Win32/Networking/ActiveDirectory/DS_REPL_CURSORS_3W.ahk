#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\DS_REPL_CURSOR_3W.ahk

/**
 * The DS_REPL_CURSORS_3 structure is used with the DsReplicaGetInfo2 function to provide replication state data with respect to all replicas of a given naming context.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/ns-ntdsapi-ds_repl_cursors_3w
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DS_REPL_CURSORS_3W extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Contains  the number of elements in the <b>rgCursor</b> array.
     * @type {Integer}
     */
    cNumCursors {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Contains the zero-based index of the next entry to retrieve if more entries are available. This value is passed for the <i>dwEnumerationContext</i> parameter in the next call to <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsreplicagetinfo2w">DsReplicaGetInfo2</a> to retrieve the next block of entries. If no more entries are available, this member contains -1.
     * @type {Integer}
     */
    dwEnumerationContext {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_repl_cursor_3w">DS_REPL_CURSOR_3</a> structures that contain the requested replication data. The <b>cNumCursors</b> member contains the number of elements in this array.
     * @type {Array<DS_REPL_CURSOR_3W>}
     */
    rgCursor{
        get {
            if(!this.HasProp("__rgCursorProxyArray"))
                this.__rgCursorProxyArray := Win32FixedArray(this.ptr + 8, 8, DS_REPL_CURSOR_3W, "")
            return this.__rgCursorProxyArray
        }
    }
}
