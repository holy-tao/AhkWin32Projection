#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_TIMED_TEXT_BOUTEN_POSITION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_BOUTEN_POSITION_BEFORE => 0

    /**
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_BOUTEN_POSITION_AFTER => 1

    /**
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_BOUTEN_POSITION_OUTSIDE => 2
}
