#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct TBINSERTMARK_FLAGS {
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
    static TBIMHT_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TBIMHT_AFTER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TBIMHT_BACKGROUND => 2
}
