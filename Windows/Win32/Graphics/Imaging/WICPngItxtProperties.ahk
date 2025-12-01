#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the Portable Network Graphics (PNG) iTXT chunk metadata properties.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicpngitxtproperties
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICPngItxtProperties extends Win32Enum{

    /**
     * [VT_LPSTR] Indicates the keywords in the iTXT metadata chunk.
     * @type {Integer (Int32)}
     */
    static WICPngItxtKeyword => 1

    /**
     * [VT_UI1] Indicates whether the text in the iTXT chunk is compressed. 1 if the text is compressed; otherwise, 0.
     * @type {Integer (Int32)}
     */
    static WICPngItxtCompressionFlag => 2

    /**
     * [VT_LPSTR] Indicates the human language used by the translated keyword and the text.
     * @type {Integer (Int32)}
     */
    static WICPngItxtLanguageTag => 3

    /**
     * [VT_LPWSTR] Indicates a translation of the keyword into the language indicated by the language tag.
     * @type {Integer (Int32)}
     */
    static WICPngItxtTranslatedKeyword => 4

    /**
     * [VT_LPWSTR] Indicates additional text in the iTXT metadata chunk.
     * @type {Integer (Int32)}
     */
    static WICPngItxtText => 5
}
