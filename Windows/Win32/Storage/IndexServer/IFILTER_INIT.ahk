#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.IndexServer
 */
export default struct IFILTER_INIT {
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
    static IFILTER_INIT_CANON_PARAGRAPHS => 1

    /**
     * @type {Integer (Int32)}
     */
    static IFILTER_INIT_HARD_LINE_BREAKS => 2

    /**
     * @type {Integer (Int32)}
     */
    static IFILTER_INIT_CANON_HYPHENS => 4

    /**
     * @type {Integer (Int32)}
     */
    static IFILTER_INIT_CANON_SPACES => 8

    /**
     * @type {Integer (Int32)}
     */
    static IFILTER_INIT_APPLY_INDEX_ATTRIBUTES => 16

    /**
     * @type {Integer (Int32)}
     */
    static IFILTER_INIT_APPLY_OTHER_ATTRIBUTES => 32

    /**
     * @type {Integer (Int32)}
     */
    static IFILTER_INIT_APPLY_CRAWL_ATTRIBUTES => 256

    /**
     * @type {Integer (Int32)}
     */
    static IFILTER_INIT_INDEXING_ONLY => 64

    /**
     * @type {Integer (Int32)}
     */
    static IFILTER_INIT_SEARCH_LINKS => 128

    /**
     * @type {Integer (Int32)}
     */
    static IFILTER_INIT_FILTER_OWNED_VALUE_OK => 512

    /**
     * @type {Integer (Int32)}
     */
    static IFILTER_INIT_FILTER_AGGRESSIVE_BREAK => 1024

    /**
     * @type {Integer (Int32)}
     */
    static IFILTER_INIT_DISABLE_EMBEDDED => 2048

    /**
     * @type {Integer (Int32)}
     */
    static IFILTER_INIT_EMIT_FORMATTING => 4096
}
