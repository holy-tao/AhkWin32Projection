#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 */
class FEEDS_BACKGROUNDSYNC_STATUS extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static FBSS_DISABLED => 0

    /**
     * @type {Integer (Int32)}
     */
    static FBSS_ENABLED => 1
}
