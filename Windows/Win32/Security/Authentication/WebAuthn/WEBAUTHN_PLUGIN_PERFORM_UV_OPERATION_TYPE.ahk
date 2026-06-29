#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct WEBAUTHN_PLUGIN_PERFORM_UV_OPERATION_TYPE {
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
    static PerformUserVerification => 1

    /**
     * @type {Integer (Int32)}
     */
    static GetUserVerificationCount => 2

    /**
     * @type {Integer (Int32)}
     */
    static GetPublicKey => 3
}
