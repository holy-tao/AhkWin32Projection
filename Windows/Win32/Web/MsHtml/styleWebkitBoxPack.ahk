#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleWebkitBoxPack {
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
    static styleWebkitBoxPackStart => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleWebkitBoxPackEnd => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleWebkitBoxPackCenter => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleWebkitBoxPackJustify => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleWebkitBoxPackNotSet => 5

    /**
     * @type {Integer (Int32)}
     */
    static styleWebkitBoxPack_Max => 2147483647
}
