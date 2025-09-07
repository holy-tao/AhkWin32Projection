#Requires AutoHotkey v2.0.0 64-bit

/**
 * The ADS_PREFERENCES_ENUM enumeration specifies the query preferences of the OLE DB provider for ADSI.
 * @remarks
 * Because VBScript cannot read data from a type library, VBScript applications do not recognize the symbolic constants as defined above. Instead, use the numerical constants to set the appropriate flags in your VBScript application. To use the symbolic constants, as a good programming practice, write explicit declarations of such constants, as done here, in your VBScript application.
 * @see https://learn.microsoft.com/windows/win32/api/iads/ne-iads-ads_preferences_enum
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_PREFERENCES_ENUM{

    /**
     * Requests an asynchronous search.
     * @type {Integer (Int32)}
     */
    static ADSIPROP_ASYNCHRONOUS => 0

    /**
     * Specifies that aliases of found objects are to be resolved. Use  <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_derefenum">ADS_DEREFENUM</a> to specify how to perform this operation.
     * @type {Integer (Int32)}
     */
    static ADSIPROP_DEREF_ALIASES => 1

    /**
     * Specifies the size limit that the server should observe in a search. The size limit is the maximum number of returned objects. A zero value indicates that no size limit is imposed. The server stops searching once the size limit is reached and returns the results accumulated up to that point.
     * @type {Integer (Int32)}
     */
    static ADSIPROP_SIZE_LIMIT => 2

    /**
     * Specifies the time limit, in seconds, that the server should observe in a search. A zero value indicates that no time limit restriction is imposed. When the time limit is reached, the server stops searching and returns  results  accumulated to that point.
     * @type {Integer (Int32)}
     */
    static ADSIPROP_TIME_LIMIT => 3

    /**
     * Indicates that the search should obtain only the name of attributes to which values have been assigned.
     * @type {Integer (Int32)}
     */
    static ADSIPROP_ATTRIBTYPES_ONLY => 4

    /**
     * Specifies the search scope that should be observed by the server. For more information about the appropriate settings, see the  <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_scopeenum">ADS_SCOPEENUM</a> enumeration.
     * @type {Integer (Int32)}
     */
    static ADSIPROP_SEARCH_SCOPE => 5

    /**
     * Specifies the time limit, in seconds, that a client will wait for the server to return the result.
     * @type {Integer (Int32)}
     */
    static ADSIPROP_TIMEOUT => 6

    /**
     * Specifies the page size in a paged search. For each request by the client, the server returns, at most, the number of objects as set by the page size.
     * @type {Integer (Int32)}
     */
    static ADSIPROP_PAGESIZE => 7

    /**
     * Specifies the time limit, in seconds, that the server should observe to search a page of results; this is  opposed to the time limit for the entire search.
     * @type {Integer (Int32)}
     */
    static ADSIPROP_PAGED_TIME_LIMIT => 8

    /**
     * Specifies that referrals may be chased. If the root search is not specified in the naming context of the server or when the search results cross a naming context (for example, when you have child domains and search in the parent domain), the server sends a referral message to the client which the client can choose to ignore or chase. By default, this option is set to ADS_CHASE_REFERRALS_EXTERNAL. For more information about referrals chasing, see  <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_chase_referrals_enum">ADS_CHASE_REFERRALS_ENUM</a>.
     * @type {Integer (Int32)}
     */
    static ADSIPROP_CHASE_REFERRALS => 9

    /**
     * Specifies that the server sorts the result set. Use the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/ns-iads-ads_sortkey">ADS_SORTKEY</a> structure to specify the sort keys.
     * @type {Integer (Int32)}
     */
    static ADSIPROP_SORT_ON => 10

    /**
     * Specifies if the result should be cached on the client side. By default, ADSI caches the result set. Turning off this option may be more desirable for large result sets.
     * @type {Integer (Int32)}
     */
    static ADSIPROP_CACHE_RESULTS => 11

    /**
     * Allows the OLEDB client to specify bind flags to use when binding to the server. Valid values are those allowed by  <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-adsopenobject">ADsOpenObject</a>. It is accessed from ADO scripts using the property name "ADSI Flag."
     * @type {Integer (Int32)}
     */
    static ADSIPROP_ADSIFLAG => 12
}
