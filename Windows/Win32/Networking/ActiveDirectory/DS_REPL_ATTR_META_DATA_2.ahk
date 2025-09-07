#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * The DS_REPL_ATTR_META_DATA_2 structure is used with the DsReplicaGetInfo and DsReplicaGetInfo2 functions to contain replication state data for an object attribute.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/ns-ntdsapi-ds_repl_attr_meta_data_2
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DS_REPL_ATTR_META_DATA_2 extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Pointer to a null-terminated Unicode string that contains the LDAP display name of the attribute that corresponds to this metadata.
     * @type {Pointer<Ptr>}
     */
    pszAttributeName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Contains the version of this attribute. Each originating modification of the attribute increases this value by one. Replication of a modification does not affect the version.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Contains the time at which the last originating change was made to this attribute. Replication of the change does not affect this value.
     * @type {FILETIME}
     */
    ftimeLastOriginatingChange{
        get {
            if(!this.HasProp("__ftimeLastOriginatingChange"))
                this.__ftimeLastOriginatingChange := FILETIME(this.ptr + 16)
            return this.__ftimeLastOriginatingChange
        }
    }

    /**
     * Contains the invocation identification of the server on which the last change was made to this attribute. Replication of the change does not affect this value.
     * @type {Pointer<Guid>}
     */
    uuidLastOriginatingDsaInvocationID {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Contains the update sequence number (USN) on the originating server at which the last change to this attribute was made. Replication of the change does not affect this value.
     * @type {Integer}
     */
    usnOriginatingChange {
        get => NumGet(this, 32, "int64")
        set => NumPut("int64", value, this, 32)
    }

    /**
     * Contains the USN on the destination server (the server from which the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsreplicagetinfow">DsReplicaGetInfo</a> function retrieved the metadata) at which the last change to this attribute was applied. This value typically is different on all servers.
     * @type {Integer}
     */
    usnLocalChange {
        get => NumGet(this, 40, "int64")
        set => NumPut("int64", value, this, 40)
    }

    /**
     * Pointer to a null-terminated Unicode string that contains the distinguished name of the directory system agent server that originated the last replication.
     * @type {Pointer<Ptr>}
     */
    pszLastOriginatingDsaDN {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
