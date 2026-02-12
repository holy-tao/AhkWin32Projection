#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the type of data contained in the sync root.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageproviderprotectionmode
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class StorageProviderProtectionMode extends Win32Enum{

    /**
     * The sync root can contain any type of file.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The sync root should only contain personal files, not encrypted or business related files.
     * @type {Integer (Int32)}
     */
    static Personal => 1
}
