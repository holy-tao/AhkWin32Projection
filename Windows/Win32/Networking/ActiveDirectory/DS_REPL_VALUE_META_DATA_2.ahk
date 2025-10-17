#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * Used with the DS_REPL_ATTR_VALUE_META_DATA_2 structure to contain attribute value replication metadata.
 * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/ns-ntdsapi-ds_repl_value_meta_data_2
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DS_REPL_VALUE_META_DATA_2 extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * Pointer to a null-terminated Unicode string that contains the LDAP display name of the attribute that corresponds to this metadata.
     * @type {PWSTR}
     */
    pszAttributeName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a null-terminated Unicode string that contains the distinguished name of the object that this attribute belongs to.
     * @type {PWSTR}
     */
    pszObjectDn {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Contains the number of bytes in the <b>pbData</b> array.
     * @type {Integer}
     */
    cbData {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Pointer to a buffer that contains the attribute replication metadata. The <b>cbData</b> member contains the length of this buffer, in bytes.
     * @type {Pointer<Byte>}
     */
    pbData {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the time this attribute was deleted.
     * @type {FILETIME}
     */
    ftimeDeleted{
        get {
            if(!this.HasProp("__ftimeDeleted"))
                this.__ftimeDeleted := FILETIME(32, this)
            return this.__ftimeDeleted
        }
    }

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the time this attribute was created.
     * @type {FILETIME}
     */
    ftimeCreated{
        get {
            if(!this.HasProp("__ftimeCreated"))
                this.__ftimeCreated := FILETIME(40, this)
            return this.__ftimeCreated
        }
    }

    /**
     * Contains the version of this attribute. Each originating modification of the attribute increases this value by one. Replication of a modification does not affect the version.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the time at which the last originating change was made to this attribute. Replication of the change does not affect this value.
     * @type {FILETIME}
     */
    ftimeLastOriginatingChange{
        get {
            if(!this.HasProp("__ftimeLastOriginatingChange"))
                this.__ftimeLastOriginatingChange := FILETIME(56, this)
            return this.__ftimeLastOriginatingChange
        }
    }

    /**
     * Contains the invocation identifier of the server on which the last change was made to this attribute. Replication of the change does not affect this value.
     * @type {Pointer<Guid>}
     */
    uuidLastOriginatingDsaInvocationID {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Contains the update sequence number (USN) on the originating server at which the last change to this attribute was made. Replication of the change does not affect this value.
     * @type {Integer}
     */
    usnOriginatingChange {
        get => NumGet(this, 72, "int64")
        set => NumPut("int64", value, this, 72)
    }

    /**
     * Contains the USN on the destination server, that is, the server from which the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsreplicagetinfo2w">DsReplicaGetInfo2</a> function retrieved the metadata, at which the last change to this attribute was applied. This value is typically different on all servers.
     * @type {Integer}
     */
    usnLocalChange {
        get => NumGet(this, 80, "int64")
        set => NumPut("int64", value, this, 80)
    }

    /**
     * Pointer to a null-terminated Unicode string that contains the distinguished name of the directory system agent server that originated the last replication.
     * @type {PWSTR}
     */
    pszLastOriginatingDsaDN {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }
}
