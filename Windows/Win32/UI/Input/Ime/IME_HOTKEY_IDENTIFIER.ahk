#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class IME_HOTKEY_IDENTIFIER extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static IME_CHOTKEY_IME_NONIME_TOGGLE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IME_CHOTKEY_SHAPE_TOGGLE => 17

    /**
     * @type {Integer (UInt32)}
     */
    static IME_CHOTKEY_SYMBOL_TOGGLE => 18

    /**
     * @type {Integer (UInt32)}
     */
    static IME_JHOTKEY_CLOSE_OPEN => 48

    /**
     * @type {Integer (UInt32)}
     */
    static IME_KHOTKEY_SHAPE_TOGGLE => 80

    /**
     * @type {Integer (UInt32)}
     */
    static IME_KHOTKEY_HANJACONVERT => 81

    /**
     * @type {Integer (UInt32)}
     */
    static IME_KHOTKEY_ENGLISH => 82

    /**
     * @type {Integer (UInt32)}
     */
    static IME_THOTKEY_IME_NONIME_TOGGLE => 112

    /**
     * @type {Integer (UInt32)}
     */
    static IME_THOTKEY_SHAPE_TOGGLE => 113

    /**
     * @type {Integer (UInt32)}
     */
    static IME_THOTKEY_SYMBOL_TOGGLE => 114

    /**
     * @type {Integer (UInt32)}
     */
    static IME_ITHOTKEY_RESEND_RESULTSTR => 512

    /**
     * @type {Integer (UInt32)}
     */
    static IME_ITHOTKEY_PREVIOUS_COMPOSITION => 513

    /**
     * @type {Integer (UInt32)}
     */
    static IME_ITHOTKEY_UISTYLE_TOGGLE => 514

    /**
     * @type {Integer (UInt32)}
     */
    static IME_ITHOTKEY_RECONVERTSTRING => 515
}
