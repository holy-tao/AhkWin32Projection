#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct VALIDATEUNC_OPTION {
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
    static VALIDATEUNC_CONNECT => 1

    /**
     * @type {Integer (Int32)}
     */
    static VALIDATEUNC_NOUI => 2

    /**
     * @type {Integer (Int32)}
     */
    static VALIDATEUNC_PRINT => 4

    /**
     * @type {Integer (Int32)}
     */
    static VALIDATEUNC_PERSIST => 8

    /**
     * @type {Integer (Int32)}
     */
    static VALIDATEUNC_VALID => 15
}
