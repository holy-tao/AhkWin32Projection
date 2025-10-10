#Requires AutoHotkey v2.0.0 64-bit

/**
 * These flags enumerate reasons why URLs are included or excluded from the current crawl scope.
 * @see https://docs.microsoft.com/windows/win32/api//searchapi/ne-searchapi-clusion_reason
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class CLUSION_REASON{

    /**
     * The URL has been excluded because its scope in unknown. There is no scope that would include or exclude this URL so it is excluded by default.
     * @type {Integer (Int32)}
     */
    static CLUSIONREASON_UNKNOWNSCOPE => 0

    /**
     * The URL has been included or excluded by a default rule. Default rules are set during setup or first run.
     * @type {Integer (Int32)}
     */
    static CLUSIONREASON_DEFAULT => 1

    /**
     * The URL has been included or excluded by a user rule. User rules are set either by the user through Control Panel or by a calling application through the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchcrawlscopemanager">ISearchCrawlScopeManager</a> interface.
     * @type {Integer (Int32)}
     */
    static CLUSIONREASON_USER => 2

    /**
     * Not Supported.
     * @type {Integer (Int32)}
     */
    static CLUSIONREASON_GROUPPOLICY => 3
}
