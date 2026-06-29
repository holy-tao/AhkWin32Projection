#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct HLINKGETREF {
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
    static HLINKGETREF_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static HLINKGETREF_ABSOLUTE => 1

    /**
     * @type {Integer (Int32)}
     */
    static HLINKGETREF_RELATIVE => 2
}
