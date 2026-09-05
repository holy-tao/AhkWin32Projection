#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
class PLUGIN_LOCK_STATUS extends Win32Enum {

    /**
     * Native name: PluginLocked
     * @type {Integer (Int32)}
     */
    static Locked => 0

    /**
     * Native name: PluginUnlocked
     * @type {Integer (Int32)}
     */
    static Unlocked => 1
}
