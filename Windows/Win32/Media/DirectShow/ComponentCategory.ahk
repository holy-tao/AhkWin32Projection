#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class ComponentCategory extends Win32Enum {

    /**
     * Native name: CategoryNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => -1

    /**
     * Native name: CategoryOther
     * @type {Integer (Int32)}
     */
    static Other => 0

    /**
     * Native name: CategoryVideo
     * @type {Integer (Int32)}
     */
    static Video => 1

    /**
     * Native name: CategoryAudio
     * @type {Integer (Int32)}
     */
    static Audio => 2

    /**
     * Native name: CategoryText
     * @type {Integer (Int32)}
     */
    static Text => 3

    /**
     * Native name: CategorySubtitles
     * @type {Integer (Int32)}
     */
    static Subtitles => 4

    /**
     * Native name: CategoryCaptions
     * @type {Integer (Int32)}
     */
    static Captions => 5

    /**
     * Native name: CategorySuperimpose
     * @type {Integer (Int32)}
     */
    static Superimpose => 6

    /**
     * Native name: CategoryData
     * @type {Integer (Int32)}
     */
    static Data => 7

    /**
     * Native name: CATEGORY_COUNT
     * @type {Integer (Int32)}
     */
    static COUNT => 8
}
