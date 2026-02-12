#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes when Windows will request an update to a file.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.cachedfileoptions
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class CachedFileOptions extends Win32BitflagEnum{

    /**
     * Another app may be able to access the locally cached copy of the file without triggering an update.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * An update always triggers when another app accesses the locally cached copy of the file.
     * @type {Integer (UInt32)}
     */
    static RequireUpdateOnAccess => 1

    /**
     * An update triggers when another app accesses the locally cached copy of the file if a network connection is available.  Otherwise, other apps can access the local file without triggering an update.
     * @type {Integer (UInt32)}
     */
    static UseCachedFileWhenOffline => 2

    /**
     * An update triggers when another app accesses the locally cached copy of the file if a network connection is available.  Otherwise, other apps are denied access to the local file.
     * @type {Integer (UInt32)}
     */
    static DenyAccessWhenOffline => 4
}
