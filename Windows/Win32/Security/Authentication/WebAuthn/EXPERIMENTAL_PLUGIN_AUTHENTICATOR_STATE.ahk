#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
class EXPERIMENTAL_PLUGIN_AUTHENTICATOR_STATE extends Win32Enum {

    /**
     * Native name: PluginAuthenticatorState_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: PluginAuthenticatorState_Disabled
     * @type {Integer (Int32)}
     */
    static Disabled => 1

    /**
     * Native name: PluginAuthenticatorState_Enabled
     * @type {Integer (Int32)}
     */
    static Enabled => 2
}
