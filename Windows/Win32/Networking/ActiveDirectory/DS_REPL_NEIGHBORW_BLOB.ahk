#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * Contains inbound replication state data for a particular naming context and source server pair.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/ns-ntdsapi-ds_repl_neighborw_blob
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
class DS_REPL_NEIGHBORW_BLOB extends Win32Struct {
    static sizeof => 128

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
     * @type {Guid}
     */
    uuidNamingContextObjGuid {
        get {
            if(!this.HasProp("__uuidNamingContextObjGuid"))
                this.__uuidNamingContextObjGuid := Guid(24, this)
            return this.__uuidNamingContextObjGuid
        }
    }

    /**
     * Contains the <b>objectGuid</b> of the <b>nTDSDSA</b> object that corresponds to <b>pszSourceDsaDN</b>.
     * @type {Guid}
     */
    uuidSourceDsaObjGuid {
        get {
            if(!this.HasProp("__uuidSourceDsaObjGuid"))
                this.__uuidSourceDsaObjGuid := Guid(40, this)
            return this.__uuidSourceDsaObjGuid
        }
    }

    /**
     * Contains the invocation identifier used by the source server as of the last replication attempt.
     * @type {Guid}
     */
    uuidSourceDsaInvocationID {
        get {
            if(!this.HasProp("__uuidSourceDsaInvocationID"))
                this.__uuidSourceDsaInvocationID := Guid(56, this)
            return this.__uuidSourceDsaInvocationID
        }
    }

    /**
     * Contains the <b>objectGuid</b> of the inter-site transport object that corresponds to <b>pszAsyncIntersiteTransportDN</b>.
     * @type {Guid}
     */
    uuidAsyncIntersiteTransportObjGuid {
        get {
            if(!this.HasProp("__uuidAsyncIntersiteTransportObjGuid"))
                this.__uuidAsyncIntersiteTransportObjGuid := Guid(72, this)
            return this.__uuidAsyncIntersiteTransportObjGuid
        }
    }

    /**
     * Contains the update sequence number of the last object update received.
     * @type {Integer}
     */
    usnLastObjChangeSynced {
        get => NumGet(this, 88, "int64")
        set => NumPut("int64", value, this, 88)
    }

    /**
     * Contains the <b>usnLastObjChangeSynced</b> value at the end of the last complete, successful replication cycle, or 0 if none. Attributes at the source last updated at a update sequence number less than or equal to this value have already been received and applied by the destination.
     * @type {Integer}
     */
    usnAttributeFilter {
        get => NumGet(this, 96, "int64")
        set => NumPut("int64", value, this, 96)
    }

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the date and time the last successful replication cycle was completed from this source. All members of this structure are zero if the replication cycle has never been completed.
     * @type {FILETIME}
     */
    ftimeLastSyncSuccess {
        get {
            if(!this.HasProp("__ftimeLastSyncSuccess"))
                this.__ftimeLastSyncSuccess := FILETIME(104, this)
            return this.__ftimeLastSyncSuccess
        }
    }

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the date and time of the last replication attempt from this source. All members of this structure are zero if the replication  has never been attempted.
     * @type {FILETIME}
     */
    ftimeLastSyncAttempt {
        get {
            if(!this.HasProp("__ftimeLastSyncAttempt"))
                this.__ftimeLastSyncAttempt := FILETIME(112, this)
            return this.__ftimeLastSyncAttempt
        }
    }

    /**
     * Contains a Windows error code associated with the last replication attempt from this source. Contains <b>ERROR_SUCCESS</b> if the last attempt was successful.
     * @type {Integer}
     */
    dwLastSyncResult {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * Contains the number of failed replication attempts that have been made from this source since the last successful replication attempt or since the source was added as a neighbor, if no previous attempt succeeded.
     * @type {Integer}
     */
    cNumConsecutiveSyncFailures {
        get => NumGet(this, 124, "uint")
        set => NumPut("uint", value, this, 124)
    }
}
