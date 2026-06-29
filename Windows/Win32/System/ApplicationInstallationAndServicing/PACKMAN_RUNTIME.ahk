#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct PACKMAN_RUNTIME {
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
    static PACKMAN_RUNTIME_NATIVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static PACKMAN_RUNTIME_SILVERLIGHTMOBILE => 2

    /**
     * @type {Integer (Int32)}
     */
    static PACKMAN_RUNTIME_XNA => 3

    /**
     * @type {Integer (Int32)}
     */
    static PACKMAN_RUNTIME_MODERN_NATIVE => 4

    /**
     * @type {Integer (Int32)}
     */
    static PACKMAN_RUNTIME_JUPITER => 5

    /**
     * @type {Integer (Int32)}
     */
    static PACKMAN_RUNTIME_INVALID => 6
}
