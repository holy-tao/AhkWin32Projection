#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the Portable Network Graphics (PNG) iTXT chunk metadata properties.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicpngitxtproperties
 * @namespace Windows.Win32.Graphics.Imaging
 */
class WICPngItxtProperties extends Win32Enum {

    /**
     * [VT_LPSTR] Indicates the keywords in the iTXT metadata chunk.
     * Native name: WICPngItxtKeyword
     * @type {Integer (Int32)}
     */
    static Keyword => 1

    /**
     * [VT_UI1] Indicates whether the text in the iTXT chunk is compressed. 1 if the text is compressed; otherwise, 0.
     * Native name: WICPngItxtCompressionFlag
     * @type {Integer (Int32)}
     */
    static CompressionFlag => 2

    /**
     * [VT_LPSTR] Indicates the human language used by the translated keyword and the text.
     * Native name: WICPngItxtLanguageTag
     * @type {Integer (Int32)}
     */
    static LanguageTag => 3

    /**
     * [VT_LPWSTR] Indicates a translation of the keyword into the language indicated by the language tag.
     * Native name: WICPngItxtTranslatedKeyword
     * @type {Integer (Int32)}
     */
    static TranslatedKeyword => 4

    /**
     * [VT_LPWSTR] Indicates additional text in the iTXT metadata chunk.
     * Native name: WICPngItxtText
     * @type {Integer (Int32)}
     */
    static Text => 5
}
