#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 */
export default struct BG_TOKEN {
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
    static BG_TOKEN_LOCAL_FILE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BG_TOKEN_NETWORK => 2
}
