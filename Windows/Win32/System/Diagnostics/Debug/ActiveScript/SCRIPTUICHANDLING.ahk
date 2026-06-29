#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct SCRIPTUICHANDLING {
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
    static SCRIPTUICHANDLING_ALLOW => 0

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTUICHANDLING_NOUIERROR => 1

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTUICHANDLING_NOUIDEFAULT => 2
}
