#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
class WM_PLAYBACK_DRC_LEVEL extends Win32Enum {

    /**
     * Native name: WM_PLAYBACK_DRC_HIGH
     * @type {Integer (Int32)}
     */
    static HIGH => 0

    /**
     * Native name: WM_PLAYBACK_DRC_MEDIUM
     * @type {Integer (Int32)}
     */
    static MEDIUM => 1

    /**
     * Native name: WM_PLAYBACK_DRC_LOW
     * @type {Integer (Int32)}
     */
    static LOW => 2
}
