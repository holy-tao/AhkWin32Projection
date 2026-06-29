#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct SCRIPT_ERROR_DEBUG_EXCEPTION_THROWN_KIND {
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
    static ETK_FIRST_CHANCE => 0

    /**
     * @type {Integer (Int32)}
     */
    static ETK_USER_UNHANDLED => 1

    /**
     * @type {Integer (Int32)}
     */
    static ETK_UNHANDLED => 2
}
