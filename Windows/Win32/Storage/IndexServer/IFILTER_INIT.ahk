#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.IndexServer
 */
class IFILTER_INIT extends Win32Enum {

    /**
     * Native name: IFILTER_INIT_CANON_PARAGRAPHS
     * @type {Integer (Int32)}
     */
    static CANON_PARAGRAPHS => 1

    /**
     * Native name: IFILTER_INIT_HARD_LINE_BREAKS
     * @type {Integer (Int32)}
     */
    static HARD_LINE_BREAKS => 2

    /**
     * Native name: IFILTER_INIT_CANON_HYPHENS
     * @type {Integer (Int32)}
     */
    static CANON_HYPHENS => 4

    /**
     * Native name: IFILTER_INIT_CANON_SPACES
     * @type {Integer (Int32)}
     */
    static CANON_SPACES => 8

    /**
     * Native name: IFILTER_INIT_APPLY_INDEX_ATTRIBUTES
     * @type {Integer (Int32)}
     */
    static APPLY_INDEX_ATTRIBUTES => 16

    /**
     * Native name: IFILTER_INIT_APPLY_OTHER_ATTRIBUTES
     * @type {Integer (Int32)}
     */
    static APPLY_OTHER_ATTRIBUTES => 32

    /**
     * Native name: IFILTER_INIT_APPLY_CRAWL_ATTRIBUTES
     * @type {Integer (Int32)}
     */
    static APPLY_CRAWL_ATTRIBUTES => 256

    /**
     * Native name: IFILTER_INIT_INDEXING_ONLY
     * @type {Integer (Int32)}
     */
    static INDEXING_ONLY => 64

    /**
     * Native name: IFILTER_INIT_SEARCH_LINKS
     * @type {Integer (Int32)}
     */
    static SEARCH_LINKS => 128

    /**
     * Native name: IFILTER_INIT_FILTER_OWNED_VALUE_OK
     * @type {Integer (Int32)}
     */
    static FILTER_OWNED_VALUE_OK => 512

    /**
     * Native name: IFILTER_INIT_FILTER_AGGRESSIVE_BREAK
     * @type {Integer (Int32)}
     */
    static FILTER_AGGRESSIVE_BREAK => 1024

    /**
     * Native name: IFILTER_INIT_DISABLE_EMBEDDED
     * @type {Integer (Int32)}
     */
    static DISABLE_EMBEDDED => 2048

    /**
     * Native name: IFILTER_INIT_EMIT_FORMATTING
     * @type {Integer (Int32)}
     */
    static EMIT_FORMATTING => 4096
}
