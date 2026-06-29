#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ADSVALUE.ahk" { ADSVALUE }
#Import ".\ADS_OCTET_STRING.ahk" { ADS_OCTET_STRING }
#Import ".\ADS_SEARCHPREF_ENUM.ahk" { ADS_SEARCHPREF_ENUM }
#Import ".\ADS_DN_WITH_BINARY.ahk" { ADS_DN_WITH_BINARY }
#Import ".\ADS_DN_WITH_STRING.ahk" { ADS_DN_WITH_STRING }
#Import ".\ADS_TYPEDNAME.ahk" { ADS_TYPEDNAME }
#Import ".\ADS_FAXNUMBER.ahk" { ADS_FAXNUMBER }
#Import ".\ADS_STATUSENUM.ahk" { ADS_STATUSENUM }
#Import ".\ADS_OCTET_LIST.ahk" { ADS_OCTET_LIST }
#Import "..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }
#Import ".\ADS_PROV_SPECIFIC.ahk" { ADS_PROV_SPECIFIC }
#Import ".\ADS_CASEIGNORE_LIST.ahk" { ADS_CASEIGNORE_LIST }
#Import ".\ADS_HOLD.ahk" { ADS_HOLD }
#Import ".\ADS_PATH.ahk" { ADS_PATH }
#Import ".\ADS_NT_SECURITY_DESCRIPTOR.ahk" { ADS_NT_SECURITY_DESCRIPTOR }
#Import ".\ADSTYPE.ahk" { ADSTYPE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ADS_NETADDRESS.ahk" { ADS_NETADDRESS }
#Import ".\ADS_TIMESTAMP.ahk" { ADS_TIMESTAMP }
#Import ".\ADS_POSTALADDRESS.ahk" { ADS_POSTALADDRESS }
#Import ".\ADS_BACKLINK.ahk" { ADS_BACKLINK }
#Import ".\ADS_EMAIL.ahk" { ADS_EMAIL }
#Import ".\ADS_REPLICAPOINTER.ahk" { ADS_REPLICAPOINTER }

/**
 * The ADS_SEARCHPREF_INFO structure specifies the query preferences.
 * @remarks
 * To setup a search preference, assign appropriate values to the fields of an  <b>ADS_SEARCHPREF_INFO</b> structure passed to the server. The <b>vValue</b> member of the <b>ADS_SEARCHPREF_INFO</b> structure is an <a href="https://docs.microsoft.com/windows/desktop/api/iads/ns-iads-adsvalue">ADSVALUE</a> structure. The following table lists the <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_searchpref_enum">ADS_SEARCHPREF_ENUM</a> values, the corresponding values for the <b>dwType</b> member of the <b>ADSVALUE</b> structure, and the <b>ADSVALUE</b> member that is used for the specified type.
 * 
 * <table>
 * <tr>
 * <th>
 * <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_searchpref_enum">ADS_SEARCHPREF_ENUM</a> Value</th>
 * <th><b>dwType</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/iads/ns-iads-adsvalue">ADSVALUE</a>
 * </th>
 * <th>
 * <a href="https://docs.microsoft.com/windows/desktop/api/iads/ns-iads-adsvalue">ADSVALUE</a> member</th>
 * </tr>
 * <tr>
 * <td><b>ADS_SEARCHPREF_ASYNCHRONOUS</b></td>
 * <td><b>ADSTYPE_BOOLEAN</b></td>
 * <td><b>Boolean</b></td>
 * </tr>
 * <tr>
 * <td><b>ADS_SEARCHPREF_DEREF_ALIASES</b></td>
 * <td><b>ADSTYPE_INTEGER</b></td>
 * <td><b>Integer</b></td>
 * </tr>
 * <tr>
 * <td><b>ADS_SEARCHPREF_SIZE_LIMIT</b></td>
 * <td><b>ADSTYPE_INTEGER</b></td>
 * <td><b>Integer</b></td>
 * </tr>
 * <tr>
 * <td><b>ADS_SEARCHPREF_TIME_LIMIT</b></td>
 * <td><b>ADSTYPE_INTEGER</b></td>
 * <td><b>Integer</b></td>
 * </tr>
 * <tr>
 * <td><b>ADS_SEARCHPREF_ATTRIBTYPES_ONLY</b></td>
 * <td><b>ADSTYPE_BOOLEAN</b></td>
 * <td><b>Boolean</b></td>
 * </tr>
 * <tr>
 * <td><b>ADS_SEARCHPREF_SEARCH_SCOPE</b></td>
 * <td><b>ADSTYPE_INTEGER</b></td>
 * <td><b>Integer</b></td>
 * </tr>
 * <tr>
 * <td><b>ADS_SEARCHPREF_TIMEOUT</b></td>
 * <td><b>ADSTYPE_INTEGER</b></td>
 * <td><b>Integer</b></td>
 * </tr>
 * <tr>
 * <td><b>ADS_SEARCHPREF_PAGESIZE</b></td>
 * <td><b>ADSTYPE_INTEGER</b></td>
 * <td><b>Integer</b></td>
 * </tr>
 * <tr>
 * <td><b>ADS_SEARCHPREF_PAGED_TIME_LIMIT</b></td>
 * <td><b>ADSTYPE_INTEGER</b></td>
 * <td><b>Integer</b></td>
 * </tr>
 * <tr>
 * <td><b>ADS_SEARCHPREF_CHASE_REFERRALS</b></td>
 * <td><b>ADSTYPE_INTEGER</b></td>
 * <td><b>Integer</b></td>
 * </tr>
 * <tr>
 * <td><b>ADS_SEARCHPREF_SORT_ON</b></td>
 * <td><b>ADSTYPE_PROV_SPECIFIC</b></td>
 * <td><b>ProviderSpecific</b></td>
 * </tr>
 * <tr>
 * <td><b>ADS_SEARCHPREF_CACHE_RESULTS</b></td>
 * <td><b>ADSTYPE_BOOLEAN</b></td>
 * <td><b>Boolean</b></td>
 * </tr>
 * <tr>
 * <td><b>ADS_SEARCHPREF_DIRSYNC</b></td>
 * <td><b>ADSTYPE_PROV_SPECIFIC</b></td>
 * <td><b>ProviderSpecific</b></td>
 * </tr>
 * <tr>
 * <td><b>ADS_SEARCHPREF_TOMBSTONE</b></td>
 * <td><b>ADSTYPE_BOOLEAN</b></td>
 * <td><b>Boolean</b></td>
 * </tr>
 * <tr>
 * <td><b>ADS_SEARCHPREF_VLV</b></td>
 * <td><b>ADSTYPE_PROV_SPECIFIC</b></td>
 * <td><b>ProviderSpecific</b></td>
 * </tr>
 * <tr>
 * <td><b>ADS_SEARCHPREF_ATTRIBUTE_QUERY</b></td>
 * <td><b>ADSTYPE_CASE_IGNORE_STRING</b></td>
 * <td><b>CaseIgnoreString</b></td>
 * </tr>
 * <tr>
 * <td><b>ADS_SEARCHPREF_SECURITY_MASK</b></td>
 * <td><b>ADSTYPE_INTEGER</b></td>
 * <td><b>Integer</b></td>
 * </tr>
 * <tr>
 * <td><b>ADS_SEARCHPREF_DIRSYNC_FLAG</b></td>
 * <td><b>ADSTYPE_INTEGER</b></td>
 * <td><b>Integer</b></td>
 * </tr>
 * <tr>
 * <td><b>ADS_SEARCHPREF_EXTENDED_DN</b></td>
 * <td><b>ADSTYPE_INTEGER</b></td>
 * <td><b>Integer</b></td>
 * </tr>
 * </table>
 *  
 * 
 * For more information and examples of how to use the <b>ADS_SEARCHPREF_INFO</b> structure, see the discussions of the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-idirectorysearch-setsearchpreference">IDirectorySearch::SetSearchPreference</a> method and the  <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_searchpref_enum">ADS_SEARCHPREF_ENUM</a> enumeration.
 * @see https://learn.microsoft.com/windows/win32/api/iads/ns-iads-ads_searchpref_info
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct ADS_SEARCHPREF_INFO {
    #StructPack 8

    /**
     * Contains one of the  <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_searchpref_enum">ADS_SEARCHPREF_ENUM</a> enumeration values that specifies the search option to set.
     */
    dwSearchPref : ADS_SEARCHPREF_ENUM

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/iads/ns-iads-adsvalue">ADSVALUE</a> structure that specifies the data type and value of the search preference.
     */
    vValue : ADSVALUE

    /**
     * Receives one of the  <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_statusenum">ADS_STATUSENUM</a> enumeration values that indicates the status of the search preference. The <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-idirectorysearch-setsearchpreference">IDirectorySearch::SetSearchPreference</a> method will fill in this member when it is called.
     */
    dwStatus : ADS_STATUSENUM

}
