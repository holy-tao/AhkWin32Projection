#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DS_REPL_ATTR_META_DATA.ahk" { DS_REPL_ATTR_META_DATA }

/**
 * The DS_REPL_OBJ_META_DATA structure contains an array of DS_REPL_ATTR_META_DATA structures. These structures contain replication state data for past and present attributes for a given object.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/ns-ntdsapi-ds_repl_obj_meta_data
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct DS_REPL_OBJ_META_DATA {
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
     * Contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_repl_attr_meta_data">DS_REPL_ATTR_META_DATA</a> structures. The <b>cNumEntries</b> member contains the number of elements in this array.
     */
    rgMetaData : DS_REPL_ATTR_META_DATA[1]

}
