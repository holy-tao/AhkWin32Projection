#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct URLTEMPLATE {
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
    static URLTEMPLATE_CUSTOM => 0

    /**
     * @type {Integer (Int32)}
     */
    static URLTEMPLATE_PREDEFINED_MIN => 65536

    /**
     * @type {Integer (Int32)}
     */
    static URLTEMPLATE_LOW => 65536

    /**
     * @type {Integer (Int32)}
     */
    static URLTEMPLATE_MEDLOW => 66816

    /**
     * @type {Integer (Int32)}
     */
    static URLTEMPLATE_MEDIUM => 69632

    /**
     * @type {Integer (Int32)}
     */
    static URLTEMPLATE_MEDHIGH => 70912

    /**
     * @type {Integer (Int32)}
     */
    static URLTEMPLATE_HIGH => 73728

    /**
     * @type {Integer (Int32)}
     */
    static URLTEMPLATE_PREDEFINED_MAX => 131072
}
