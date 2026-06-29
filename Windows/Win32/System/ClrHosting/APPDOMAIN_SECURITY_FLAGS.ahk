#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct APPDOMAIN_SECURITY_FLAGS {
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
    static APPDOMAIN_SECURITY_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static APPDOMAIN_SECURITY_SANDBOXED => 1

    /**
     * @type {Integer (Int32)}
     */
    static APPDOMAIN_SECURITY_FORBID_CROSSAD_REVERSE_PINVOKE => 2

    /**
     * @type {Integer (Int32)}
     */
    static APPDOMAIN_FORCE_TRIVIAL_WAIT_OPERATIONS => 8
}
