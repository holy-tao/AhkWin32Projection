#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.Ime
 */
class IME_HOTKEY_IDENTIFIER extends Win32Enum {

    /**
     * Native name: IME_CHOTKEY_IME_NONIME_TOGGLE
     * @type {Integer (UInt32)}
     */
    static CHOTKEY_IME_NONIME_TOGGLE => 16

    /**
     * Native name: IME_CHOTKEY_SHAPE_TOGGLE
     * @type {Integer (UInt32)}
     */
    static CHOTKEY_SHAPE_TOGGLE => 17

    /**
     * Native name: IME_CHOTKEY_SYMBOL_TOGGLE
     * @type {Integer (UInt32)}
     */
    static CHOTKEY_SYMBOL_TOGGLE => 18

    /**
     * Native name: IME_JHOTKEY_CLOSE_OPEN
     * @type {Integer (UInt32)}
     */
    static JHOTKEY_CLOSE_OPEN => 48

    /**
     * Native name: IME_KHOTKEY_SHAPE_TOGGLE
     * @type {Integer (UInt32)}
     */
    static KHOTKEY_SHAPE_TOGGLE => 80

    /**
     * Native name: IME_KHOTKEY_HANJACONVERT
     * @type {Integer (UInt32)}
     */
    static KHOTKEY_HANJACONVERT => 81

    /**
     * Native name: IME_KHOTKEY_ENGLISH
     * @type {Integer (UInt32)}
     */
    static KHOTKEY_ENGLISH => 82

    /**
     * Native name: IME_THOTKEY_IME_NONIME_TOGGLE
     * @type {Integer (UInt32)}
     */
    static THOTKEY_IME_NONIME_TOGGLE => 112

    /**
     * Native name: IME_THOTKEY_SHAPE_TOGGLE
     * @type {Integer (UInt32)}
     */
    static THOTKEY_SHAPE_TOGGLE => 113

    /**
     * Native name: IME_THOTKEY_SYMBOL_TOGGLE
     * @type {Integer (UInt32)}
     */
    static THOTKEY_SYMBOL_TOGGLE => 114

    /**
     * Native name: IME_ITHOTKEY_RESEND_RESULTSTR
     * @type {Integer (UInt32)}
     */
    static ITHOTKEY_RESEND_RESULTSTR => 512

    /**
     * Native name: IME_ITHOTKEY_PREVIOUS_COMPOSITION
     * @type {Integer (UInt32)}
     */
    static ITHOTKEY_PREVIOUS_COMPOSITION => 513

    /**
     * Native name: IME_ITHOTKEY_UISTYLE_TOGGLE
     * @type {Integer (UInt32)}
     */
    static ITHOTKEY_UISTYLE_TOGGLE => 514

    /**
     * Native name: IME_ITHOTKEY_RECONVERTSTRING
     * @type {Integer (UInt32)}
     */
    static ITHOTKEY_RECONVERTSTRING => 515
}
