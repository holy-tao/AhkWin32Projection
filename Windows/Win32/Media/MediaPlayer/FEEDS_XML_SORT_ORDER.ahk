#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 */
class FEEDS_XML_SORT_ORDER extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static FXSO_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static FXSO_ASCENDING => 1

    /**
     * @type {Integer (Int32)}
     */
    static FXSO_DESCENDING => 2
}
