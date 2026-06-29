#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct EXPERIMENTAL_PLUGIN_AUTHENTICATOR_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
