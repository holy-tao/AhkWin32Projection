#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct WINTRUST_GET_DEFAULT_FOR_USAGE_ACTION {
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
    static DWACTION_ALLOCANDFILL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DWACTION_FREE => 2
}
