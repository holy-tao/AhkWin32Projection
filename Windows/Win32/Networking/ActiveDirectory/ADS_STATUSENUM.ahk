#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the status of a search preference set with the IDirectorySearch::SetSearchPreference method.
 * @remarks
 * 
 * The  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-idirectorysearch-setsearchpreference">IDirectorySearch::SetSearchPreference</a> method sets the <b>dwStatus</b> member <a href="https://docs.microsoft.com/windows/desktop/api/iads/ns-iads-ads_searchpref_info">ADS_SEARCHPREF_INFO</a> structure to one of the <b>ADS_STATUSENUM</b> values to indicate the status of the corresponding search preference. Callers can use this status value to decide whether to execute a search.
 * 
 * The <b>ADS_STATUS_INVALID_SEARCHPREF</b> status value may be set if you set a valid search preference, but that preference is not supported. For example, if you set <b>ADS_SEARCHPREF_SORT_ON</b>, but the server you communicate with does not support the LDAP server-side sort control, the <b>dwStatus</b> member of the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/ns-iads-ads_searchpref_info">ADS_SEARCHPREF_INFO</a> structure is set to <b>ADS_STATUS_INVALID_SEARCHPREF</b> by the <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-idirectorysearch-setsearchpreference">IDirectorySearch::SetSearchPreference</a> call.
 * 
 * <div class="alert"><b>Note</b>  Because VBScript cannot read data from a type library, VBScript applications do not recognize the symbolic constants as defined above. You should use the numeric constants instead to set the appropriate flags in your VBScript applications. To use the symbolic constants as a good programming practice, write explicit declarations of such constants, as done in the following code example.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/ne-iads-ads_statusenum
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_STATUSENUM{

    /**
     * The search preference was set successfully.
     * @type {Integer (Int32)}
     */
    static ADS_STATUS_S_OK => 0

    /**
     * The search preference specified in the <b>dwSearchPref</b> member of the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/ns-iads-ads_searchpref_info">ADS_SEARCHPREF_INFO</a> structure is invalid. Search preferences must be taken from the  <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_searchpref_enum">ADS_SEARCHPREF_ENUM</a> enumeration.
     * @type {Integer (Int32)}
     */
    static ADS_STATUS_INVALID_SEARCHPREF => 1

    /**
     * The value specified in the <b>vValue</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/iads/ns-iads-ads_searchpref_info">ADS_SEARCHPREF_INFO</a> structure is invalid for the corresponding search preference.
     * @type {Integer (Int32)}
     */
    static ADS_STATUS_INVALID_SEARCHPREFVALUE => 2
}
