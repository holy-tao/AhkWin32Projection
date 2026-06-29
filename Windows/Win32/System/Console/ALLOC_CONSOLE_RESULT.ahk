#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Console
 */
export default struct ALLOC_CONSOLE_RESULT {
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
    static ALLOC_CONSOLE_RESULT_NO_CONSOLE => 0

    /**
     * @type {Integer (Int32)}
     */
    static ALLOC_CONSOLE_RESULT_NEW_CONSOLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static ALLOC_CONSOLE_RESULT_EXISTING_CONSOLE => 2
}
