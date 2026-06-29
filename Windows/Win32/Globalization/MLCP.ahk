#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct MLCP {
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
    static MLDETECTF_MAILNEWS => 1

    /**
     * @type {Integer (Int32)}
     */
    static MLDETECTF_BROWSER => 2

    /**
     * @type {Integer (Int32)}
     */
    static MLDETECTF_VALID => 4

    /**
     * @type {Integer (Int32)}
     */
    static MLDETECTF_VALID_NLS => 8

    /**
     * @type {Integer (Int32)}
     */
    static MLDETECTF_PRESERVE_ORDER => 16

    /**
     * @type {Integer (Int32)}
     */
    static MLDETECTF_PREFERRED_ONLY => 32

    /**
     * @type {Integer (Int32)}
     */
    static MLDETECTF_FILTER_SPECIALCHAR => 64

    /**
     * @type {Integer (Int32)}
     */
    static MLDETECTF_EURO_UTF8 => 128
}
