#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines how randomness should be contributed to the issued key during a security token negotiation done with message and mixed-mode security.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_security_key_entropy_mode
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_SECURITY_KEY_ENTROPY_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Only client contributes entropy.
     * @type {Integer (Int32)}
     */
    static WS_SECURITY_KEY_ENTROPY_MODE_CLIENT_ONLY => 1

    /**
     * Only service contributes entropy.
     * @type {Integer (Int32)}
     */
    static WS_SECURITY_KEY_ENTROPY_MODE_SERVER_ONLY => 2

    /**
     * Both contribute entropy.
     * @type {Integer (Int32)}
     */
    static WS_SECURITY_KEY_ENTROPY_MODE_COMBINED => 3
}
