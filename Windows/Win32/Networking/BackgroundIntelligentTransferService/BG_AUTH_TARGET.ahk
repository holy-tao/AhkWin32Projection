#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines constants that specify whether the credentials are used for proxy or server user authentication requests.
 * @see https://learn.microsoft.com/windows/win32/api/bits1_5/ne-bits1_5-bg_auth_target
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 */
export default struct BG_AUTH_TARGET {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Use credentials for server requests.
     * @type {Integer (Int32)}
     */
    static BG_AUTH_TARGET_SERVER => 1

    /**
     * Use credentials for proxy requests.
     * @type {Integer (Int32)}
     */
    static BG_AUTH_TARGET_PROXY => 2
}
