#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class FONT_CHARSET extends Win32Enum{

    /**
     * @type {Integer (Byte)}
     */
    static ANSI_CHARSET => 0x00

    /**
     * @type {Integer (Byte)}
     */
    static DEFAULT_CHARSET => 0x01

    /**
     * @type {Integer (Byte)}
     */
    static SYMBOL_CHARSET => 0x02

    /**
     * @type {Integer (Byte)}
     */
    static SHIFTJIS_CHARSET => 0x80

    /**
     * @type {Integer (Byte)}
     */
    static HANGEUL_CHARSET => 0x81

    /**
     * @type {Integer (Byte)}
     */
    static HANGUL_CHARSET => 0x81

    /**
     * @type {Integer (Byte)}
     */
    static GB2312_CHARSET => 0x86

    /**
     * @type {Integer (Byte)}
     */
    static CHINESEBIG5_CHARSET => 0x88

    /**
     * @type {Integer (Byte)}
     */
    static OEM_CHARSET => 0xFF

    /**
     * @type {Integer (Byte)}
     */
    static JOHAB_CHARSET => 0x82

    /**
     * @type {Integer (Byte)}
     */
    static HEBREW_CHARSET => 0xB1

    /**
     * @type {Integer (Byte)}
     */
    static ARABIC_CHARSET => 0xB2

    /**
     * @type {Integer (Byte)}
     */
    static GREEK_CHARSET => 0xA1

    /**
     * @type {Integer (Byte)}
     */
    static TURKISH_CHARSET => 0xA2

    /**
     * @type {Integer (Byte)}
     */
    static VIETNAMESE_CHARSET => 0xA3

    /**
     * @type {Integer (Byte)}
     */
    static THAI_CHARSET => 0xDE

    /**
     * @type {Integer (Byte)}
     */
    static EASTEUROPE_CHARSET => 0xEE

    /**
     * @type {Integer (Byte)}
     */
    static RUSSIAN_CHARSET => 0xCC

    /**
     * @type {Integer (Byte)}
     */
    static MAC_CHARSET => 0x4D

    /**
     * @type {Integer (Byte)}
     */
    static BALTIC_CHARSET => 0xBA
}
