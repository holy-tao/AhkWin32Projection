#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Used with the DS_REPL_ATTR_VALUE_META_DATA structure to contain attribute value replication metadata.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/ns-ntdsapi-ds_repl_value_meta_data
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct DS_REPL_VALUE_META_DATA {
    #StructPack 8

    /**
     * Pointer to a null-terminated Unicode string that contains the LDAP display name of the attribute corresponding to this metadata.
     */
    pszAttributeName : PWSTR

    /**
     * Pointer to a null-terminated Unicode string that contains the distinguished name of the object that this attribute belongs to.
     */
    pszObjectDn : PWSTR

    /**
     * Contains the number of bytes in the <b>pbData</b> array.
     */
    cbData : UInt32

    /**
     * Pointer to a buffer that contains the attribute replication metadata. The <b>cbData</b> member contains the length, in bytes, of this buffer.
     */
    pbData : IntPtr

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the time this attribute was deleted.
     */
    ftimeDeleted : FILETIME

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the time this attribute was created.
     */
    ftimeCreated : FILETIME

    /**
     * Contains the version of this attribute. Each originating modification of the attribute increases this value by one. Replication of a modification does not affect the version.
     */
    dwVersion : UInt32

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the time at which the last originating change was made to this attribute. Replication of the change does not affect this value.
     */
    ftimeLastOriginatingChange : FILETIME

    /**
     * Contains the invocation identifier of the server on which the last change was made to this attribute. Replication of the change does not affect this value.
     */
    uuidLastOriginatingDsaInvocationID : Guid

    /**
     * Contains the update sequence number (USN) on the originating server at which the last change to this attribute was made. Replication of the change does not affect this value.
     */
    usnOriginatingChange : Int64

    /**
     * Contains the USN on the destination server, that is the server from which the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsreplicagetinfo2w">DsReplicaGetInfo2</a> function retrieved the metadata, at which the last change to this attribute was applied. This value is typically different on all servers.
     */
    usnLocalChange : Int64

}
