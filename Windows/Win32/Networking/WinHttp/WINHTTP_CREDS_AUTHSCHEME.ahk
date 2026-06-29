#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinHttp
 */
export default struct WINHTTP_CREDS_AUTHSCHEME {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_AUTH_SCHEME_BASIC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_AUTH_SCHEME_NTLM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_AUTH_SCHEME_NEGOTIATE => 16
}
