#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct MMSSF_GET_INFORMATION_FLAGS {
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
    static MMSSF_HASCLOCK => 1

    /**
     * @type {Integer (Int32)}
     */
    static MMSSF_SUPPORTSEEK => 2

    /**
     * @type {Integer (Int32)}
     */
    static MMSSF_ASYNCHRONOUS => 4
}
