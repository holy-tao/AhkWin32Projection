#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * Contains inbound replication state data for a particular naming context and source server pair, as returned by the DsReplicaGetInfo and DsReplicaGetInfo2 functions.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/ns-ntdsapi-ds_repl_neighborw
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
class DS_REPL_NEIGHBORW extends Win32Struct {
    static sizeof => 144

    static packingSize => 8

    /**
     * Pointer to a null-terminated string that contains the naming context to which this replication state data pertains. Each naming context is replicated independently and has different associated neighbor data, even if the naming contexts are replicated from the same source server.
     * @type {PWSTR}
     */
    pszNamingContext {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to  a null-terminated string that contains the distinguished name of the directory service agent corresponding to the source server to which this replication state data pertains.  Each source server has different associated neighbor data.
     * @type {PWSTR}
     */
    pszSourceDsaDN {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to  a null-terminated string that contains the transport-specific network address of the source server. That is, a directory name service name for RPC/IP replication, or an SMTP address for an SMTP replication.
     * @type {PWSTR}
     */
    pszSourceDsaAddress {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to  a null-terminated string that contains the distinguished name of the <b>interSiteTransport</b> object that corresponds to the transport over which replication is performed. This member contains <b>NULL</b> for RPC/IP replication.
     * @type {PWSTR}
     */
    pszAsyncIntersiteTransportDN {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Contains a set of flags that specify attributes and options for the replication data. This can be zero or a combination of one or more of the following flags.
     * @type {Integer}
     */
    dwReplicaFlags {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Reserved for future use.
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Contains the <b>objectGuid</b> of the naming context corresponding to <b>pszNamingContext</b>.
     * @type {Guid}
     */
    uuidNamingContextObjGuid {
        get {
            if(!this.HasProp("__uuidNamingContextObjGuid"))
                this.__uuidNamingContextObjGuid := Guid(40, this)
            return this.__uuidNamingContextObjGuid
        }
    }

    /**
     * Contains the <b>objectGuid</b> of the <b>nTDSDSA</b> object corresponding to <b>pszSourceDsaDN</b>.
     * @type {Guid}
     */
    uuidSourceDsaObjGuid {
        get {
            if(!this.HasProp("__uuidSourceDsaObjGuid"))
                this.__uuidSourceDsaObjGuid := Guid(56, this)
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
                this.__uuidSourceDsaInvocationID := Guid(72, this)
            return this.__uuidSourceDsaInvocationID
        }
    }

    /**
     * Contains the <b>objectGuid</b> of the inter-site transport object corresponding to <b>pszAsyncIntersiteTransportDN</b>.
     * @type {Guid}
     */
    uuidAsyncIntersiteTransportObjGuid {
        get {
            if(!this.HasProp("__uuidAsyncIntersiteTransportObjGuid"))
                this.__uuidAsyncIntersiteTransportObjGuid := Guid(88, this)
            return this.__uuidAsyncIntersiteTransportObjGuid
        }
    }

    /**
     * Contains the update sequence number of the last object update received.
     * @type {Integer}
     */
    usnLastObjChangeSynced {
        get => NumGet(this, 104, "int64")
        set => NumPut("int64", value, this, 104)
    }

    /**
     * Contains the <b>usnLastObjChangeSynced</b> value at the end of the last complete, successful replication cycle, or 0 if none. Attributes at the source last updated at a update sequence number less than or equal to this value have already been received and applied by the destination.
     * @type {Integer}
     */
    usnAttributeFilter {
        get => NumGet(this, 112, "int64")
        set => NumPut("int64", value, this, 112)
    }

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the date and time the last successful replication cycle was completed from this source. All members of this structure are zero if the replication cycle has never been completed.
     * @type {FILETIME}
     */
    ftimeLastSyncSuccess {
        get {
            if(!this.HasProp("__ftimeLastSyncSuccess"))
                this.__ftimeLastSyncSuccess := FILETIME(120, this)
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
                this.__ftimeLastSyncAttempt := FILETIME(128, this)
            return this.__ftimeLastSyncAttempt
        }
    }

    /**
     * Contains an error code associated with the last replication attempt from this source. Contains <b>ERROR_SUCCESS</b> if the last attempt succeeded.
     * @type {Integer}
     */
    dwLastSyncResult {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * Contains the number of failed replication attempts from this source since the last successful replication attempt - or since the source was added as a neighbor, if no previous attempt was successful.
     * @type {Integer}
     */
    cNumConsecutiveSyncFailures {
        get => NumGet(this, 140, "uint")
        set => NumPut("uint", value, this, 140)
    }
}
