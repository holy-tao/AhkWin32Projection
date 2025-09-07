#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the text granularity used to trim text overflowing the layout box.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_trimming_granularity
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_TRIMMING_GRANULARITY{

    /**
     * No trimming occurs. Text flows beyond the layout width.
     * @type {Integer (Int32)}
     */
    static DWRITE_TRIMMING_GRANULARITY_NONE => 0

    /**
     * Trimming occurs at a character cluster boundary.
     * @type {Integer (Int32)}
     */
    static DWRITE_TRIMMING_GRANULARITY_CHARACTER => 1

    /**
     * Trimming occurs at a word boundary.
     * @type {Integer (Int32)}
     */
    static DWRITE_TRIMMING_GRANULARITY_WORD => 2
}
