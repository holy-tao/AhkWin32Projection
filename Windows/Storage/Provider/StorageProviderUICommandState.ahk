#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * This enum provides information that dictates the visibility and opacity of StorageProviderUICommands.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovideruicommandstate
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class StorageProviderUICommandState extends Win32Enum{

    /**
     * The command is visible and enabled.
     * @type {Integer (Int32)}
     */
    static Enabled => 0

    /**
     * The command is visible and disabled.
     * @type {Integer (Int32)}
     */
    static Disabled => 1

    /**
     * The command is not displayed.
     * @type {Integer (Int32)}
     */
    static Hidden => 2
}
