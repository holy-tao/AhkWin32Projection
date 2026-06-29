#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DS_REPL_ATTR_META_DATA_2.ahk" { DS_REPL_ATTR_META_DATA_2 }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The DS_REPL_OBJ_META_DATA_2 structure contains an array of DS_REPL_ATTR_META_DATA_2 structures, which in turn contain replication state data for the attributes (past and present) for a given object, as returned by the DsReplicaGetInfo2 function.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/ns-ntdsapi-ds_repl_obj_meta_data_2
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct DS_REPL_OBJ_META_DATA_2 {
    #StructPack 8

    /**
     * Contains the number of elements in the <b>rgMetaData</b> array.
     */
    cNumEntries : UInt32

    /**
     * Not used.
     */
    dwReserved : UInt32

    /**
     * Contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_repl_attr_meta_data_2">DS_REPL_ATTR_META_DATA_2</a> structures. The <b>cNumEntries</b> member contains the number of elements in this array.
     */
    rgMetaData : DS_REPL_ATTR_META_DATA_2[1]

}
