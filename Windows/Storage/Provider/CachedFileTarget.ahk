#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates whether updates should be applied to the locally cached copy or the remote version of the file.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.cachedfiletarget
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class CachedFileTarget extends Win32Enum{

    /**
     * Update the locally cached copy of the file.
     * @type {Integer (Int32)}
     */
    static Local => 0

    /**
     * Update the remote version of the file.
     * @type {Integer (Int32)}
     */
    static Remote => 1
}
