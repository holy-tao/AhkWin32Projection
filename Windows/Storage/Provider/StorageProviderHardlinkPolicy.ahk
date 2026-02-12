#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies whether hard links are permitted on a placeholder file or folder. By default, hard links are not allowed on a placeholder.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageproviderhardlinkpolicy
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class StorageProviderHardlinkPolicy extends Win32BitflagEnum{

    /**
     * No hard links are allowed.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Hard links are allowed on a placeholder within the same sync root.
     * @type {Integer (UInt32)}
     */
    static Allowed => 1
}
