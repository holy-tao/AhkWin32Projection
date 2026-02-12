#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the possible usage kinds for a storage provider result.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageproviderresultusagekind
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class StorageProviderResultUsageKind extends Win32Enum{

    /**
     * The result is being rendered to the user.
     * @type {Integer (Int32)}
     */
    static Rendered => 0

    /**
     * The result is being opened.
     * @type {Integer (Int32)}
     */
    static Opened => 1

    /**
     * The result is being used in a suggestion response.
     * @type {Integer (Int32)}
     */
    static SuggestionResponseReceived => 2
}
