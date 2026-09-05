#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines which character set a specified string is encoded with.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-dvd_textcharset
 * @namespace Windows.Win32.Media.DirectShow
 */
class DVD_TextCharSet extends Win32Enum {

    /**
     * Unicode character set.
     * Native name: DVD_CharSet_Unicode
     * @type {Integer (Int32)}
     */
    static Unicode => 0

    /**
     * ISO 646 character set.
     * Native name: DVD_CharSet_ISO646
     * @type {Integer (Int32)}
     */
    static ISO646 => 1

    /**
     * Japanese Industrial Standards (JIS) Roman Kanji character set.
     * Native name: DVD_CharSet_JIS_Roman_Kanji
     * @type {Integer (Int32)}
     */
    static JIS_Roman_Kanji => 2

    /**
     * ISO 8859-1 character set.
     * Native name: DVD_CharSet_ISO8859_1
     * @type {Integer (Int32)}
     */
    static ISO8859_1 => 3

    /**
     * JIS Kanji-Roman-Katakana character set.
     * Native name: DVD_CharSet_ShiftJIS_Kanji_Roman_Katakana
     * @type {Integer (Int32)}
     */
    static ShiftJIS_Kanji_Roman_Katakana => 4
}
