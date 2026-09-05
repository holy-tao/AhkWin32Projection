#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.Ime
 */
class IME_SENTENCE_MODE extends Win32BitflagEnum {

    /**
     * Native name: IME_SMODE_NONE
     * @type {Integer (UInt32)}
     */
    static SMODE_NONE => 0

    /**
     * Native name: IME_SMODE_PLAURALCLAUSE
     * @type {Integer (UInt32)}
     */
    static SMODE_PLAURALCLAUSE => 1

    /**
     * Native name: IME_SMODE_SINGLECONVERT
     * @type {Integer (UInt32)}
     */
    static SMODE_SINGLECONVERT => 2

    /**
     * Native name: IME_SMODE_AUTOMATIC
     * @type {Integer (UInt32)}
     */
    static SMODE_AUTOMATIC => 4

    /**
     * Native name: IME_SMODE_PHRASEPREDICT
     * @type {Integer (UInt32)}
     */
    static SMODE_PHRASEPREDICT => 8

    /**
     * Native name: IME_SMODE_CONVERSATION
     * @type {Integer (UInt32)}
     */
    static SMODE_CONVERSATION => 16

    /**
     * Native name: IME_SMODE_RESERVED
     * @type {Integer (UInt32)}
     */
    static SMODE_RESERVED => 61440
}
