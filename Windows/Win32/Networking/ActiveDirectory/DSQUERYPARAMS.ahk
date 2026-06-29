#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DSCOLUMN.ahk" { DSCOLUMN }
#Import "..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }

/**
 * The DSQUERYPARAMS structure contains query data used by the directory service query when searching the directory service.
 * @see https://learn.microsoft.com/windows/win32/api/dsquery/ns-dsquery-dsqueryparams
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct DSQUERYPARAMS {
    #StructPack 8

    /**
     * Contains the size, in bytes, of the <b>DSQUERYPARAMS</b> structure. This member is used for versioning of the structure.
     */
    cbStruct : UInt32

    /**
     * Reserved.
     */
    dwFlags : UInt32

    /**
     * Contains an instance handle used for extracting resources.
     */
    hInstance : HINSTANCE

    /**
     * Contains the offset, in bytes,  from the address of this structure to a null-terminated Unicode string that contains the  LDAP filter.
     */
    offsetQuery : Int32

    /**
     * Contains the number of elements in the <b>aColumns</b> array.
     */
    iColumns : Int32

    /**
     * Reserved.
     */
    dwReserved : UInt32

    /**
     * Contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/dsquery/ns-dsquery-dscolumn">DSCOLUMN</a> structures that contain the results of the query. The <b>iColumns</b> member specifies the number of elements in this array.
     */
    aColumns : DSCOLUMN[1]

}
