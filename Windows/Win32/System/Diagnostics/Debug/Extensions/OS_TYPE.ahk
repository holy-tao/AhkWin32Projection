#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct OS_TYPE {
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
    static WIN_95 => 0

    /**
     * @type {Integer (Int32)}
     */
    static WIN_98 => 1

    /**
     * @type {Integer (Int32)}
     */
    static WIN_ME => 2

    /**
     * @type {Integer (Int32)}
     */
    static WIN_NT4 => 3

    /**
     * @type {Integer (Int32)}
     */
    static WIN_NT5 => 4

    /**
     * @type {Integer (Int32)}
     */
    static WIN_NT5_1 => 5

    /**
     * @type {Integer (Int32)}
     */
    static WIN_NT5_2 => 6

    /**
     * @type {Integer (Int32)}
     */
    static WIN_NT6_0 => 7

    /**
     * @type {Integer (Int32)}
     */
    static WIN_NT6_1 => 8

    /**
     * @type {Integer (Int32)}
     */
    static WIN_UNDEFINED => 255
}
