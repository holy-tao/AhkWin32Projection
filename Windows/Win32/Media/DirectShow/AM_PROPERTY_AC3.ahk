#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class AM_PROPERTY_AC3 extends Win32Enum {

    /**
     * Native name: AM_PROPERTY_AC3_ERROR_CONCEALMENT
     * @type {Integer (Int32)}
     */
    static ERROR_CONCEALMENT => 1

    /**
     * Native name: AM_PROPERTY_AC3_ALTERNATE_AUDIO
     * @type {Integer (Int32)}
     */
    static ALTERNATE_AUDIO => 2

    /**
     * Native name: AM_PROPERTY_AC3_DOWNMIX
     * @type {Integer (Int32)}
     */
    static DOWNMIX => 3

    /**
     * Native name: AM_PROPERTY_AC3_BIT_STREAM_MODE
     * @type {Integer (Int32)}
     */
    static BIT_STREAM_MODE => 4

    /**
     * Native name: AM_PROPERTY_AC3_DIALOGUE_LEVEL
     * @type {Integer (Int32)}
     */
    static DIALOGUE_LEVEL => 5

    /**
     * Native name: AM_PROPERTY_AC3_LANGUAGE_CODE
     * @type {Integer (Int32)}
     */
    static LANGUAGE_CODE => 6

    /**
     * Native name: AM_PROPERTY_AC3_ROOM_TYPE
     * @type {Integer (Int32)}
     */
    static ROOM_TYPE => 7
}
