#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The DS_REPL_ATTR_META_DATA_2 structure is used with the DsReplicaGetInfo and DsReplicaGetInfo2 functions to contain replication state data for an object attribute.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/ns-ntdsapi-ds_repl_attr_meta_data_2
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct DS_REPL_ATTR_META_DATA_2 {
    #StructPack 8

    /**
     * Pointer to a null-terminated Unicode string that contains the LDAP display name of the attribute that corresponds to this metadata.
     */
    pszAttributeName : PWSTR

    /**
     * Contains the version of this attribute. Each originating modification of the attribute increases this value by one. Replication of a modification does not affect the version.
     */
    dwVersion : UInt32

    /**
     * Contains the time at which the last originating change was made to this attribute. Replication of the change does not affect this value.
     */
    ftimeLastOriginatingChange : FILETIME

    /**
     * Contains the invocation identification of the server on which the last change was made to this attribute. Replication of the change does not affect this value.
     */
    uuidLastOriginatingDsaInvocationID : Guid

    /**
     * Contains the update sequence number (USN) on the originating server at which the last change to this attribute was made. Replication of the change does not affect this value.
     */
    usnOriginatingChange : Int64

    /**
     * Contains the USN on the destination server (the server from which the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsreplicagetinfow">DsReplicaGetInfo</a> function retrieved the metadata) at which the last change to this attribute was applied. This value typically is different on all servers.
     */
    usnLocalChange : Int64

    /**
     * Pointer to a null-terminated Unicode string that contains the distinguished name of the directory system agent server that originated the last replication.
     */
    pszLastOriginatingDsaDN : PWSTR

}
