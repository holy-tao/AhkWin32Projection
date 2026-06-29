#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct WINTRUST_SIGNATURE_SETTINGS_FLAGS {
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
    static WSS_VERIFY_SPECIFIC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WSS_GET_SECONDARY_SIG_COUNT => 2
}
