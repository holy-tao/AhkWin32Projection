#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct COORD_SYSTEM {
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
    static COORD_SYSTEM_GLOBAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static COORD_SYSTEM_PARENT => 1

    /**
     * @type {Integer (Int32)}
     */
    static COORD_SYSTEM_CONTAINER => 2

    /**
     * @type {Integer (Int32)}
     */
    static COORD_SYSTEM_CONTENT => 3

    /**
     * @type {Integer (Int32)}
     */
    static COORD_SYSTEM_FRAME => 4

    /**
     * @type {Integer (Int32)}
     */
    static COORD_SYSTEM_CLIENT => 5

    /**
     * @type {Integer (Int32)}
     */
    static COORD_SYSTEM_Max => 2147483647
}
