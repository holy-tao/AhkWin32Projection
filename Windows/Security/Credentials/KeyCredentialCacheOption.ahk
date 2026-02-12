#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Security.Credentials
 * @version WindowsRuntime 1.4
 */
class KeyCredentialCacheOption extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NoCache => 1

    /**
     * @type {Integer (Int32)}
     */
    static CacheWhenUnlocked => 2

    /**
     * @type {Integer (Int32)}
     */
    static CacheUnderLock => 4
}
