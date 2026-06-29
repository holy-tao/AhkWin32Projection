#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UCPTrieValueWidth {
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
    static UCPTRIE_VALUE_BITS_ANY => -1

    /**
     * @type {Integer (Int32)}
     */
    static UCPTRIE_VALUE_BITS_16 => 0

    /**
     * @type {Integer (Int32)}
     */
    static UCPTRIE_VALUE_BITS_32 => 1

    /**
     * @type {Integer (Int32)}
     */
    static UCPTRIE_VALUE_BITS_8 => 2
}
