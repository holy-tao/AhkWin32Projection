#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class IME_SENTENCE_MODE extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static IME_SMODE_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IME_SMODE_PLAURALCLAUSE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IME_SMODE_SINGLECONVERT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IME_SMODE_AUTOMATIC => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IME_SMODE_PHRASEPREDICT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IME_SMODE_CONVERSATION => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IME_SMODE_RESERVED => 61440
}
