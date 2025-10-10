#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines which character set a specified string is encoded with.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ne-strmif-dvd_textcharset
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DVD_TextCharSet{

    /**
     * Unicode character set.
     * @type {Integer (Int32)}
     */
    static DVD_CharSet_Unicode => 0

    /**
     * ISO 646 character set.
     * @type {Integer (Int32)}
     */
    static DVD_CharSet_ISO646 => 1

    /**
     * Japanese Industrial Standards (JIS) Roman Kanji character set.
     * @type {Integer (Int32)}
     */
    static DVD_CharSet_JIS_Roman_Kanji => 2

    /**
     * ISO 8859-1 character set.
     * @type {Integer (Int32)}
     */
    static DVD_CharSet_ISO8859_1 => 3

    /**
     * JIS Kanji-Roman-Katakana character set.
     * @type {Integer (Int32)}
     */
    static DVD_CharSet_ShiftJIS_Kanji_Roman_Katakana => 4
}
