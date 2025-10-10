#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * The DS_REPL_CURSOR_BLOB structure contains inbound replication state data with respect to all replicas of a given naming context.
 * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/ns-ntdsapi-ds_repl_cursor_blob
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DS_REPL_CURSOR_BLOB extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Contains the invocation identifier of the originating server to which the <b>usnAttributeFilter</b> corresponds.
     * @type {Pointer<Guid>}
     */
    uuidSourceDsaInvocationID {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Contains the maximum update sequence number to which the destination server can indicate that it has recorded all changes originated by the given server at update sequence numbers less than, or equal to, this update sequence number. This is used to filter changes at replication source servers that the destination server has already applied.
     * @type {Integer}
     */
    usnAttributeFilter {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the date and time of the last successful synchronization operation.
     * @type {FILETIME}
     */
    ftimeLastSyncSuccess{
        get {
            if(!this.HasProp("__ftimeLastSyncSuccess"))
                this.__ftimeLastSyncSuccess := FILETIME(this.ptr + 16)
            return this.__ftimeLastSyncSuccess
        }
    }

    /**
     * Contains the offset, in bytes, from the address of this structure  to  a null-terminated Unicode string that contains the distinguished name of the directory service agent that corresponds to the source server to which this replication state data applies.
     * @type {Integer}
     */
    oszSourceDsaDN {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
