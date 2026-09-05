#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.Ime
 */
class IME_CONVERSION_MODE extends Win32BitflagEnum {

    /**
     * Native name: IME_CMODE_ALPHANUMERIC
     * @type {Integer (UInt32)}
     */
    static CMODE_ALPHANUMERIC => 0

    /**
     * Native name: IME_CMODE_NATIVE
     * @type {Integer (UInt32)}
     */
    static CMODE_NATIVE => 1

    /**
     * Native name: IME_CMODE_CHINESE
     * @type {Integer (UInt32)}
     */
    static CMODE_CHINESE => 1

    /**
     * Native name: IME_CMODE_HANGUL
     * @type {Integer (UInt32)}
     */
    static CMODE_HANGUL => 1

    /**
     * Native name: IME_CMODE_JAPANESE
     * @type {Integer (UInt32)}
     */
    static CMODE_JAPANESE => 1

    /**
     * Native name: IME_CMODE_KATAKANA
     * @type {Integer (UInt32)}
     */
    static CMODE_KATAKANA => 2

    /**
     * Native name: IME_CMODE_LANGUAGE
     * @type {Integer (UInt32)}
     */
    static CMODE_LANGUAGE => 3

    /**
     * Native name: IME_CMODE_FULLSHAPE
     * @type {Integer (UInt32)}
     */
    static CMODE_FULLSHAPE => 8

    /**
     * Native name: IME_CMODE_ROMAN
     * @type {Integer (UInt32)}
     */
    static CMODE_ROMAN => 16

    /**
     * Native name: IME_CMODE_CHARCODE
     * @type {Integer (UInt32)}
     */
    static CMODE_CHARCODE => 32

    /**
     * Native name: IME_CMODE_HANJACONVERT
     * @type {Integer (UInt32)}
     */
    static CMODE_HANJACONVERT => 64

    /**
     * Native name: IME_CMODE_NATIVESYMBOL
     * @type {Integer (UInt32)}
     */
    static CMODE_NATIVESYMBOL => 128

    /**
     * Native name: IME_CMODE_HANGEUL
     * @type {Integer (UInt32)}
     */
    static CMODE_HANGEUL => 1

    /**
     * Native name: IME_CMODE_SOFTKBD
     * @type {Integer (UInt32)}
     */
    static CMODE_SOFTKBD => 128

    /**
     * Native name: IME_CMODE_NOCONVERSION
     * @type {Integer (UInt32)}
     */
    static CMODE_NOCONVERSION => 256

    /**
     * Native name: IME_CMODE_EUDC
     * @type {Integer (UInt32)}
     */
    static CMODE_EUDC => 512

    /**
     * Native name: IME_CMODE_SYMBOL
     * @type {Integer (UInt32)}
     */
    static CMODE_SYMBOL => 1024

    /**
     * Native name: IME_CMODE_FIXED
     * @type {Integer (UInt32)}
     */
    static CMODE_FIXED => 2048

    /**
     * Native name: IME_CMODE_RESERVED
     * @type {Integer (UInt32)}
     */
    static CMODE_RESERVED => 4026531840
}
