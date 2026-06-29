#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SHCNRF_SOURCE {
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
    static SHCNRF_InterruptLevel => 1

    /**
     * @type {Integer (Int32)}
     */
    static SHCNRF_ShellLevel => 2

    /**
     * @type {Integer (Int32)}
     */
    static SHCNRF_RecursiveInterrupt => 4096

    /**
     * @type {Integer (Int32)}
     */
    static SHCNRF_NewDelivery => 32768
}
