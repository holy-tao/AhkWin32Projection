#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * Contains inbound replication state data for a particular naming context and source server pair.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/ns-ntdsapi-ds_repl_neighborw_blob
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DS_REPL_NEIGHBORW_BLOB extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * Contains the offset, in bytes, from the address of this structure  to  a null-terminated Unicode string that contains the naming context to which this replication state data pertains. Each naming context is replicated independently and has different associated neighbor data, even if the naming contexts are replicated from the same source server.
     * @type {Integer}
     */
    oszNamingContext {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Contains the offset, in bytes, from the address of this structure  to  a null-terminated Unicode string that contains the distinguished name of the directory service agent corresponding to the source server to which this replication state data pertains.  Each source server has different associated neighbor data.
     * @type {Integer}
     */
    oszSourceDsaDN {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Contains the offset, in bytes, from the address of this structure  to  a null-terminated Unicode string that contains the transport-specific network address of the source server. That is, a directory name service name for RPC/IP replication, or an SMTP address for an SMTP replication.
     * @type {Integer}
     */
    oszSourceDsaAddress {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Contains the offset, in bytes, from the address of this structure  to  a null-terminated Unicode string that contains the distinguished name of the <b>interSiteTransport</b> object that corresponds to the transport over which replication is performed. This member contains <b>NULL</b> for RPC/IP replication.
     * @type {Integer}
     */
    oszAsyncIntersiteTransportDN {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Contains a set of flags that specify attributes and options for the replication data. This can be zero or a combination of one or more of the following flags.
     * @type {Integer}
     */
    dwReplicaFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Reserved for future use.
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Contains the <b>objectGuid</b> of the naming context that corresponds to <b>pszNamingContext</b>.
     * @type {Pointer<Guid>}
     */
    uuidNamingContextObjGuid {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Contains the <b>objectGuid</b> of the <b>nTDSDSA</b> object that corresponds to <b>pszSourceDsaDN</b>.
     * @type {Pointer<Guid>}
     */
    uuidSourceDsaObjGuid {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Contains the invocation identifier used by the source server as of the last replication attempt.
     * @type {Pointer<Guid>}
     */
    uuidSourceDsaInvocationID {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Contains the <b>objectGuid</b> of the inter-site transport object that corresponds to <b>pszAsyncIntersiteTransportDN</b>.
     * @type {Pointer<Guid>}
     */
    uuidAsyncIntersiteTransportObjGuid {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Contains the update sequence number of the last object update received.
     * @type {Integer}
     */
    usnLastObjChangeSynced {
        get => NumGet(this, 56, "int64")
        set => NumPut("int64", value, this, 56)
    }

    /**
     * Contains the <b>usnLastObjChangeSynced</b> value at the end of the last complete, successful replication cycle, or 0 if none. Attributes at the source last updated at a update sequence number less than or equal to this value have already been received and applied by the destination.
     * @type {Integer}
     */
    usnAttributeFilter {
        get => NumGet(this, 64, "int64")
        set => NumPut("int64", value, this, 64)
    }

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the date and time the last successful replication cycle was completed from this source. All members of this structure are zero if the replication cycle has never been completed.
     * @type {FILETIME}
     */
    ftimeLastSyncSuccess{
        get {
            if(!this.HasProp("__ftimeLastSyncSuccess"))
                this.__ftimeLastSyncSuccess := FILETIME(this.ptr + 72)
            return this.__ftimeLastSyncSuccess
        }
    }

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the date and time of the last replication attempt from this source. All members of this structure are zero if the replication  has never been attempted.
     * @type {FILETIME}
     */
    ftimeLastSyncAttempt{
        get {
            if(!this.HasProp("__ftimeLastSyncAttempt"))
                this.__ftimeLastSyncAttempt := FILETIME(this.ptr + 80)
            return this.__ftimeLastSyncAttempt
        }
    }

    /**
     * Contains a Windows error code associated with the last replication attempt from this source. Contains <b>ERROR_SUCCESS</b> if the last attempt was successful.
     * @type {Integer}
     */
    dwLastSyncResult {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * Contains the number of failed replication attempts that have been made from this source since the last successful replication attempt or since the source was added as a neighbor, if no previous attempt succeeded.
     * @type {Integer}
     */
    cNumConsecutiveSyncFailures {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }
}
