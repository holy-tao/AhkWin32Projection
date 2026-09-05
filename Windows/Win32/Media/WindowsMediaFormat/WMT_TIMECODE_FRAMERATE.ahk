#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
class WMT_TIMECODE_FRAMERATE extends Win32Enum {

    /**
     * Native name: WMT_TIMECODE_FRAMERATE_30
     * @type {Integer (Int32)}
     */
    static 30 => 0

    /**
     * Native name: WMT_TIMECODE_FRAMERATE_30DROP
     * @type {Integer (Int32)}
     */
    static 30DROP => 1

    /**
     * Native name: WMT_TIMECODE_FRAMERATE_25
     * @type {Integer (Int32)}
     */
    static 25 => 2

    /**
     * Native name: WMT_TIMECODE_FRAMERATE_24
     * @type {Integer (Int32)}
     */
    static 24 => 3
}
