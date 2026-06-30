#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * The DS_REPL_CURSOR structure contains inbound replication state data with respect to all replicas of a given naming context, as returned by the DsReplicaGetInfo and DsReplicaGetInfo2 functions.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/ns-ntdsapi-ds_repl_cursor
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
class DS_REPL_CURSOR extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * Contains the invocation identifier of the originating server to which the <b>usnAttributeFilter</b> corresponds.
     * @type {Guid}
     */
    uuidSourceDsaInvocationID {
        get {
            if(!this.HasProp("__uuidSourceDsaInvocationID"))
                this.__uuidSourceDsaInvocationID := Guid(0, this)
            return this.__uuidSourceDsaInvocationID
        }
    }

    /**
     * Contains the maximum update sequence number to which the destination server can indicate that it has recorded all changes originated by the given server at update sequence numbers less than, or equal to, this update sequence number. This is used to filter changes at replication source servers that the destination server has already applied.
     * @type {Integer}
     */
    usnAttributeFilter {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }
}
