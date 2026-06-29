#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct INSERT_TEXT_AT_SELECTION_FLAGS {
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
    static TF_IAS_NOQUERY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TF_IAS_QUERYONLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TF_IAS_NO_DEFAULT_COMPOSITION => 2147483648
}
