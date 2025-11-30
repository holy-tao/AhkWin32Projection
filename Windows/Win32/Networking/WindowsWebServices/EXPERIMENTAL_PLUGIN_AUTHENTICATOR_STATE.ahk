#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class EXPERIMENTAL_PLUGIN_AUTHENTICATOR_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PluginAuthenticatorState_Unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static PluginAuthenticatorState_Disabled => 1

    /**
     * @type {Integer (Int32)}
     */
    static PluginAuthenticatorState_Enabled => 2
}
