#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct PIDISR_INFO {
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
    static PIDISR_UP_TO_DATE => 0

    /**
     * @type {Integer (Int32)}
     */
    static PIDISR_NEEDS_ADD => 1

    /**
     * @type {Integer (Int32)}
     */
    static PIDISR_NEEDS_UPDATE => 2

    /**
     * @type {Integer (Int32)}
     */
    static PIDISR_NEEDS_DELETE => 3
}
