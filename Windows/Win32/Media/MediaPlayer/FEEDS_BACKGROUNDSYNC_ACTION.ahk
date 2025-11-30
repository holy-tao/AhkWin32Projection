#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class FEEDS_BACKGROUNDSYNC_ACTION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static FBSA_DISABLE => 0

    /**
     * @type {Integer (Int32)}
     */
    static FBSA_ENABLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static FBSA_RUNNOW => 2
}
