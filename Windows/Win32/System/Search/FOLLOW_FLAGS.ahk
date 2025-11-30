#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Used to help define behavior when crawling or indexing. These flags are used by the ISearchCrawlScopeManager::AddDefaultScopeRule and ISearchCrawlScopeManager::AddUserScopeRule methods.
 * @see https://docs.microsoft.com/windows/win32/api//searchapi/ne-searchapi-follow_flags
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class FOLLOW_FLAGS extends Win32Enum{

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
