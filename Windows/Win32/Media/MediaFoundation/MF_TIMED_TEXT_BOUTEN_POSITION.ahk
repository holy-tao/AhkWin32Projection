#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_TIMED_TEXT_BOUTEN_POSITION extends Win32Enum {

    /**
     * Native name: MF_TIMED_TEXT_BOUTEN_POSITION_BEFORE
     * @type {Integer (Int32)}
     */
    static BEFORE => 0

    /**
     * Native name: MF_TIMED_TEXT_BOUTEN_POSITION_AFTER
     * @type {Integer (Int32)}
     */
    static AFTER => 1

    /**
     * Native name: MF_TIMED_TEXT_BOUTEN_POSITION_OUTSIDE
     * @type {Integer (Int32)}
     */
    static OUTSIDE => 2
}
