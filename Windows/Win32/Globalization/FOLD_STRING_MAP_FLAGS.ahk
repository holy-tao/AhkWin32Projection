#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct FOLD_STRING_MAP_FLAGS {
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
    static MAP_COMPOSITE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MAP_EXPAND_LIGATURES => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static MAP_FOLDCZONE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MAP_FOLDDIGITS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MAP_PRECOMPOSED => 32
}
