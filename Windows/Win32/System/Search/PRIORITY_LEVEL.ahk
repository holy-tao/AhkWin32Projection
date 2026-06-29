#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used by the IRowsetPrioritization interface to sets or retrieve the current indexer prioritization level for the scope specified by a query.
 * @remarks
 * Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-searchevents">SearchEvents code sample</a>.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/ne-searchapi-priority_level
 * @namespace Windows.Win32.System.Search
 */
export default struct PRIORITY_LEVEL {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates that the indexer should process items as fast as the machine allows.
     * @type {Integer (Int32)}
     */
    static PRIORITY_LEVEL_FOREGROUND => 0

    /**
     * Indicates that the indexer should process items in this scope first, and as quickly as possible.
     * @type {Integer (Int32)}
     */
    static PRIORITY_LEVEL_HIGH => 1

    /**
     * Indicates that the indexer should process items in this scope before those at the normal rate, but after any other prioritization requests.
     * @type {Integer (Int32)}
     */
    static PRIORITY_LEVEL_LOW => 2

    /**
     * Indicates that the indexer should  process items at the normal indexer rate.
     * @type {Integer (Int32)}
     */
    static PRIORITY_LEVEL_DEFAULT => 3
}
