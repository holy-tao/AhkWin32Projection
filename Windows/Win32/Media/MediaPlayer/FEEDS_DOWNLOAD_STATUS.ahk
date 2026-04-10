#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 */
class FEEDS_DOWNLOAD_STATUS extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static FDS_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static FDS_PENDING => 1

    /**
     * @type {Integer (Int32)}
     */
    static FDS_DOWNLOADING => 2

    /**
     * @type {Integer (Int32)}
     */
    static FDS_DOWNLOADED => 3

    /**
     * @type {Integer (Int32)}
     */
    static FDS_DOWNLOAD_FAILED => 4
}
