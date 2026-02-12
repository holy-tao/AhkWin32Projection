#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates whether the file picker currently limits selection to single files, or if multiple files can be selected.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.provider.fileselectionmode
 * @namespace Windows.Storage.Pickers.Provider
 * @version WindowsRuntime 1.4
 */
class FileSelectionMode extends Win32Enum{

    /**
     * Only a single file can be selected.
     * @type {Integer (Int32)}
     */
    static Single => 0

    /**
     * Multiple files can be selected.
     * @type {Integer (Int32)}
     */
    static Multiple => 1
}
