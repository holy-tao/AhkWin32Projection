#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 * @version v4.0.30319
 */
class PLUGIN_LOCK_STATUS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PluginLocked => 0

    /**
     * @type {Integer (Int32)}
     */
    static PluginUnlocked => 1
}
