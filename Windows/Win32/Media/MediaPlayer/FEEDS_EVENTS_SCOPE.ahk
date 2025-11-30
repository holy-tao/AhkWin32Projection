#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class FEEDS_EVENTS_SCOPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static FES_ALL => 0

    /**
     * @type {Integer (Int32)}
     */
    static FES_SELF_ONLY => 1

    /**
     * @type {Integer (Int32)}
     */
    static FES_SELF_AND_CHILDREN_ONLY => 2
}
