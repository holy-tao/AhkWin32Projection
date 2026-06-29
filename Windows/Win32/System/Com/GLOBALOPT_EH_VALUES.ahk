#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct GLOBALOPT_EH_VALUES {
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
    static COMGLB_EXCEPTION_HANDLE => 0

    /**
     * @type {Integer (Int32)}
     */
    static COMGLB_EXCEPTION_DONOT_HANDLE_FATAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static COMGLB_EXCEPTION_DONOT_HANDLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static COMGLB_EXCEPTION_DONOT_HANDLE_ANY => 2
}
