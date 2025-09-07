#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ADS_OCTET_STRING.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk
#Include .\ADS_PROV_SPECIFIC.ahk
#Include .\ADS_TIMESTAMP.ahk
#Include .\ADS_BACKLINK.ahk
#Include .\ADS_HOLD.ahk
#Include .\ADS_EMAIL.ahk
#Include .\ADS_NT_SECURITY_DESCRIPTOR.ahk
#Include .\ADSVALUE.ahk

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
 * @version v4.0.30319
 */
class ADS_SEARCHPREF_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Contains one of the  <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_searchpref_enum">ADS_SEARCHPREF_ENUM</a> enumeration values that specifies the search option to set.
     * @type {Integer}
     */
    dwSearchPref {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/iads/ns-iads-adsvalue">ADSVALUE</a> structure that specifies the data type and value of the search preference.
     * @type {ADSVALUE}
     */
    vValue{
        get {
            if(!this.HasProp("__vValue"))
                this.__vValue := ADSVALUE(this.ptr + 8)
            return this.__vValue
        }
    }

    /**
     * Receives one of the  <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_statusenum">ADS_STATUSENUM</a> enumeration values that indicates the status of the search preference. The <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-idirectorysearch-setsearchpreference">IDirectorySearch::SetSearchPreference</a> method will fill in this member when it is called.
     * @type {Integer}
     */
    dwStatus {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
