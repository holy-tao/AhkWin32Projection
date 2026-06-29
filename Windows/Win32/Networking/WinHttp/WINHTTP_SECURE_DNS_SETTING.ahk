#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinHttp
 */
export default struct WINHTTP_SECURE_DNS_SETTING {
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
    static WinHttpSecureDnsSettingDefault => 0

    /**
     * @type {Integer (Int32)}
     */
    static WinHttpSecureDnsSettingForcePlaintext => 1

    /**
     * @type {Integer (Int32)}
     */
    static WinHttpSecureDnsSettingRequireEncryption => 2

    /**
     * @type {Integer (Int32)}
     */
    static WinHttpSecureDnsSettingTryEncryptionWithFallback => 3

    /**
     * @type {Integer (Int32)}
     */
    static WinHttpSecureDnsSettingMax => 4
}
