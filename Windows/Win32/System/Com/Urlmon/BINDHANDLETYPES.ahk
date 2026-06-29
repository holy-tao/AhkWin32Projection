#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct BINDHANDLETYPES {
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
    static BINDHANDLETYPES_APPCACHE => 0

    /**
     * @type {Integer (Int32)}
     */
    static BINDHANDLETYPES_DEPENDENCY => 1

    /**
     * @type {Integer (Int32)}
     */
    static BINDHANDLETYPES_COUNT => 2
}
