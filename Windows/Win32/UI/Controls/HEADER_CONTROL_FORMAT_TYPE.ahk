#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct HEADER_CONTROL_FORMAT_TYPE {
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
    static HDFT_ISSTRING => 0

    /**
     * @type {Integer (UInt32)}
     */
    static HDFT_ISNUMBER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HDFT_ISDATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HDFT_HASNOVALUE => 32768
}
