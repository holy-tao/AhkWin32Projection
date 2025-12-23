#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class FEEDS_EVENTS_ITEM_COUNT_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static FEICF_READ_ITEM_COUNT_CHANGED => 1

    /**
     * @type {Integer (Int32)}
     */
    static FEICF_UNREAD_ITEM_COUNT_CHANGED => 2
}
