#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct PUAFOUT {
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
    static PUAFOUT_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static PUAFOUT_ISLOCKZONEPOLICY => 1
}
