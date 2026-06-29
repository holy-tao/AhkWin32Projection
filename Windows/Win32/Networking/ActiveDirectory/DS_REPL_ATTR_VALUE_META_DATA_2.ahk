#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DS_REPL_VALUE_META_DATA_2.ahk" { DS_REPL_VALUE_META_DATA_2 }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Used with the DsReplicaGetInfo2 function to provide metadata for a collection of attribute values.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/ns-ntdsapi-ds_repl_attr_value_meta_data_2
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct DS_REPL_ATTR_VALUE_META_DATA_2 {
    #StructPack 8

    /**
     * Contains the number of elements in the <b>rgMetaData</b> array.
     */
    cNumEntries : UInt32

    /**
     * Contains the zero-based index of the next entry to retrieve if more entries are available. This value is passed for the <i>dwEnumerationContext</i> parameter in the next call to <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsreplicagetinfo2w">DsReplicaGetInfo2</a> to retrieve the next block of entries. If no more entries are available, this member contains -1.
     */
    dwEnumerationContext : UInt32

    /**
     * Contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_repl_value_meta_data_2">DS_REPL_VALUE_META_DATA_2</a> structures that contain the individual attribute replication values. The <b>cNumEntries</b> member contains the number of elements in this array.
     */
    rgMetaData : DS_REPL_VALUE_META_DATA_2[1]

}
