#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SPVACTIONS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SPVA_Speak => 0

    /**
     * @type {Integer (Int32)}
     */
    static SPVA_Silence => 1

    /**
     * @type {Integer (Int32)}
     */
    static SPVA_Pronounce => 2

    /**
     * @type {Integer (Int32)}
     */
    static SPVA_Bookmark => 3

    /**
     * @type {Integer (Int32)}
     */
    static SPVA_SpellOut => 4

    /**
     * @type {Integer (Int32)}
     */
    static SPVA_Section => 5

    /**
     * @type {Integer (Int32)}
     */
    static SPVA_ParseUnknownTag => 6
}
