#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class StorageProviderShareLinkState extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Enabled => 0

    /**
     * @type {Integer (Int32)}
     */
    static Disabled => 1
}
