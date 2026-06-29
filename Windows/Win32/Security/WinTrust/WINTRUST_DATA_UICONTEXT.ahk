#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct WINTRUST_DATA_UICONTEXT {
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
    static WTD_UICONTEXT_EXECUTE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WTD_UICONTEXT_INSTALL => 1
}
