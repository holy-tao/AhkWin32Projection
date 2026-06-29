#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct AUTHENTICATOR_STATE {
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
    static AuthenticatorState_Disabled => 0

    /**
     * @type {Integer (Int32)}
     */
    static AuthenticatorState_Enabled => 1
}
