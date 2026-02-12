#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The status of a search query.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersearchquerystatus
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class StorageProviderSearchQueryStatus extends Win32Enum{

    /**
     * The search query was successful.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * The search query failed.
     * @type {Integer (Int32)}
     */
    static Error => 1

    /**
     * The search query timed out.
     * @type {Integer (Int32)}
     */
    static Timeout => 2

    /**
     * The search query failed because there is no network connection.
     * @type {Integer (Int32)}
     */
    static NoNetwork => 3

    /**
     * The search query failed because of a network error.
     * @type {Integer (Int32)}
     */
    static NetworkError => 4

    /**
     * The search query failed because the user is not signed in.
     * @type {Integer (Int32)}
     */
    static NotSignedIn => 5

    /**
     * The search query failed because the specified query is not supported.
     * @type {Integer (Int32)}
     */
    static QueryNotSupported => 6

    /**
     * The search query failed because the specified sort order is not supported.
     * @type {Integer (Int32)}
     */
    static SortOrderNotSupported => 7
}
