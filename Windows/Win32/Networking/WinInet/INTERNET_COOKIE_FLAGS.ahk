#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct INTERNET_COOKIE_FLAGS {
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
    static INTERNET_COOKIE_HTTPONLY => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_COOKIE_THIRD_PARTY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_FLAG_RESTRICTED_ZONE => 131072
}
