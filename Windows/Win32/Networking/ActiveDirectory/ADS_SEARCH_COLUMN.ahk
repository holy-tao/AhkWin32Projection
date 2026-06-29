#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ADSTYPE.ahk" { ADSTYPE }
#Import ".\ADSVALUE.ahk" { ADSVALUE }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The ADS_SEARCH_COLUMN structure specifies the contents of a search column in the query returned from the directory service database.
 * @remarks
 * The <b>ADS_SEARCH_COLUMN</b> structure only contains a pointer to the array of  <a href="https://docs.microsoft.com/windows/desktop/api/iads/ns-iads-adsvalue">ADSVALUE</a> structures. Memory for the structure must be allocated separately.
 * 
 * For more information about  <b>ADS_SEARCH_COLUMN</b>, see  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-idirectorysearch-getcolumn">IDirectorySearch::GetColumn</a>.
 * @see https://learn.microsoft.com/windows/win32/api/iads/ns-iads-ads_search_column
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct ADS_SEARCH_COLUMN {
    #StructPack 8

    /**
     * A  null-terminated Unicode string that contains the name of the attribute whose values are contained in the current search column.
     */
    pszAttrName : PWSTR

    /**
     * Value from the  <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-adstypeenum">ADSTYPEENUM</a> enumeration that indicates how the attribute values are interpreted.
     */
    dwADsType : ADSTYPE

    /**
     * Array of  <a href="https://docs.microsoft.com/windows/desktop/api/iads/ns-iads-adsvalue">ADSVALUE</a> structures that contain values of the attribute in the current search column for the current row.
     */
    pADsValues : ADSVALUE.Ptr

    /**
     * Size of the <b>pADsValues</b> array.
     */
    dwNumValues : UInt32

    /**
     * Reserved for internal use by providers.
     */
    hReserved : HANDLE

}
