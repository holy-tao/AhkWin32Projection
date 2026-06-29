#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct DBSEEKENUM {
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
    static DBSEEK_INVALID => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBSEEK_FIRSTEQ => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBSEEK_LASTEQ => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBSEEK_AFTEREQ => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBSEEK_AFTER => 8

    /**
     * @type {Integer (Int32)}
     */
    static DBSEEK_BEFOREEQ => 16

    /**
     * @type {Integer (Int32)}
     */
    static DBSEEK_BEFORE => 32
}
