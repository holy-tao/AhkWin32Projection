#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class FEEDS_SYNC_SETTING extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static FSS_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static FSS_INTERVAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static FSS_MANUAL => 2

    /**
     * @type {Integer (Int32)}
     */
    static FSS_SUGGESTED => 3
}
