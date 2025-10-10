#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * The DS_REPL_ATTR_META_DATA_BLOB structure is used to contain replication state data for an object attribute.
 * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/ns-ntdsapi-ds_repl_attr_meta_data_blob
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DS_REPL_ATTR_META_DATA_BLOB extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Contains the offset, in bytes, from the address of this structure  to  a null-terminated Unicode string that contains the LDAP display name of the attribute corresponding to this metadata. A value of zero indicates an empty or <b>NULL</b> string.
     * @type {Integer}
     */
    oszAttributeName {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Contains the version of this attribute. Each originating modification of the attribute increases this value by one. Replication of a modification does not affect the version.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Contains the time at which the last originating change was made to this attribute. Replication of the change does not affect this value.
     * @type {FILETIME}
     */
    ftimeLastOriginatingChange{
        get {
            if(!this.HasProp("__ftimeLastOriginatingChange"))
                this.__ftimeLastOriginatingChange := FILETIME(this.ptr + 8)
            return this.__ftimeLastOriginatingChange
        }
    }

    /**
     * Contains the invocation identification of the server on which the last change was made to this attribute. Replication of the change does not affect this value.
     * @type {Pointer<Guid>}
     */
    uuidLastOriginatingDsaInvocationID {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Contains the update sequence number (USN) on the originating server at which the last change to this attribute was made. Replication of the change does not affect this value.
     * @type {Integer}
     */
    usnOriginatingChange {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }

    /**
     * Contains the USN on the destination server (the server from which the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsreplicagetinfow">DsReplicaGetInfo</a> function retrieved the metadata) at which the last change to this attribute was applied. This value typically is different on all servers.
     * @type {Integer}
     */
    usnLocalChange {
        get => NumGet(this, 32, "int64")
        set => NumPut("int64", value, this, 32)
    }

    /**
     * Contains the offset, in bytes, from the address of this structure  to  a null-terminated Unicode string that contains the distinguished name of the directory system agent server that originated the last replication. A value of zero indicates an empty or <b>NULL</b> string.
     * @type {Integer}
     */
    oszLastOriginatingDsaDN {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
