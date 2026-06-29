#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct WEBCRAWL_RECURSEFLAGS {
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
    static WEBCRAWL_DONT_MAKE_STICKY => 1

    /**
     * @type {Integer (Int32)}
     */
    static WEBCRAWL_GET_IMAGES => 2

    /**
     * @type {Integer (Int32)}
     */
    static WEBCRAWL_GET_VIDEOS => 4

    /**
     * @type {Integer (Int32)}
     */
    static WEBCRAWL_GET_BGSOUNDS => 8

    /**
     * @type {Integer (Int32)}
     */
    static WEBCRAWL_GET_CONTROLS => 16

    /**
     * @type {Integer (Int32)}
     */
    static WEBCRAWL_LINKS_ELSEWHERE => 32

    /**
     * @type {Integer (Int32)}
     */
    static WEBCRAWL_IGNORE_ROBOTSTXT => 128

    /**
     * @type {Integer (Int32)}
     */
    static WEBCRAWL_ONLY_LINKS_TO_HTML => 256
}
