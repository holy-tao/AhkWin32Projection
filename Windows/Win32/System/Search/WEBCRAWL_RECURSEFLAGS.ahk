#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 */
class WEBCRAWL_RECURSEFLAGS extends Win32Enum {

    /**
     * Native name: WEBCRAWL_DONT_MAKE_STICKY
     * @type {Integer (Int32)}
     */
    static DONT_MAKE_STICKY => 1

    /**
     * Native name: WEBCRAWL_GET_IMAGES
     * @type {Integer (Int32)}
     */
    static GET_IMAGES => 2

    /**
     * Native name: WEBCRAWL_GET_VIDEOS
     * @type {Integer (Int32)}
     */
    static GET_VIDEOS => 4

    /**
     * Native name: WEBCRAWL_GET_BGSOUNDS
     * @type {Integer (Int32)}
     */
    static GET_BGSOUNDS => 8

    /**
     * Native name: WEBCRAWL_GET_CONTROLS
     * @type {Integer (Int32)}
     */
    static GET_CONTROLS => 16

    /**
     * Native name: WEBCRAWL_LINKS_ELSEWHERE
     * @type {Integer (Int32)}
     */
    static LINKS_ELSEWHERE => 32

    /**
     * Native name: WEBCRAWL_IGNORE_ROBOTSTXT
     * @type {Integer (Int32)}
     */
    static IGNORE_ROBOTSTXT => 128

    /**
     * Native name: WEBCRAWL_ONLY_LINKS_TO_HTML
     * @type {Integer (Int32)}
     */
    static ONLY_LINKS_TO_HTML => 256
}
