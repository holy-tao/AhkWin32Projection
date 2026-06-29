#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used to help define behavior when crawling or indexing. These flags are used by the ISearchCrawlScopeManager::AddDefaultScopeRule and ISearchCrawlScopeManager::AddUserScopeRule methods.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/ne-searchapi-follow_flags
 * @namespace Windows.Win32.System.Search
 */
export default struct FOLLOW_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Specifies whether complex URLs (those containing a '?') should be indexed.
     * @type {Integer (Int32)}
     */
    static FF_INDEXCOMPLEXURLS => 1

    /**
     * Follow but do not index this URL.
     * @type {Integer (Int32)}
     */
    static FF_SUPPRESSINDEXING => 2
}
