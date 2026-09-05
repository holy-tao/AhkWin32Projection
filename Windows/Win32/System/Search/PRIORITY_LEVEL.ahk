#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Used by the IRowsetPrioritization interface to sets or retrieve the current indexer prioritization level for the scope specified by a query.
 * @remarks
 * Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-searchevents">SearchEvents code sample</a>.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/ne-searchapi-priority_level
 * @namespace Windows.Win32.System.Search
 */
class PRIORITY_LEVEL extends Win32Enum {

    /**
     * Indicates that the indexer should process items as fast as the machine allows.
     * Native name: PRIORITY_LEVEL_FOREGROUND
     * @type {Integer (Int32)}
     */
    static FOREGROUND => 0

    /**
     * Indicates that the indexer should process items in this scope first, and as quickly as possible.
     * Native name: PRIORITY_LEVEL_HIGH
     * @type {Integer (Int32)}
     */
    static HIGH => 1

    /**
     * Indicates that the indexer should process items in this scope before those at the normal rate, but after any other prioritization requests.
     * Native name: PRIORITY_LEVEL_LOW
     * @type {Integer (Int32)}
     */
    static LOW => 2

    /**
     * Indicates that the indexer should  process items at the normal indexer rate.
     * Native name: PRIORITY_LEVEL_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 3
}
