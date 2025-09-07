#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DS_REPL_CURSOR.ahk

/**
 * The DS_REPL_CURSORS structure is used with the DsReplicaGetInfo and DsReplicaGetInfo2 function to provide replication state data with respect to all replicas of a given naming context.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/ns-ntdsapi-ds_repl_cursors
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DS_REPL_CURSORS extends Win32Struct
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
     * Reserved for future use.
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_repl_cursor">DS_REPL_CURSOR</a> structures that contain the requested replication data. The <b>cNumCursors</b> member contains the number of elements in this array.
     * @type {Array<DS_REPL_CURSOR>}
     */
    rgCursor{
        get {
            if(!this.HasProp("__rgCursorProxyArray"))
                this.__rgCursorProxyArray := Win32FixedArray(this.ptr + 8, 8, DS_REPL_CURSOR, "")
            return this.__rgCursorProxyArray
        }
    }
}
