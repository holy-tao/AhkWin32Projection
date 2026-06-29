#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct WINTRUST_DATA_UNION_CHOICE {
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
    static WTD_CHOICE_FILE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WTD_CHOICE_CATALOG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WTD_CHOICE_BLOB => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WTD_CHOICE_SIGNER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WTD_CHOICE_CERT => 5
}
