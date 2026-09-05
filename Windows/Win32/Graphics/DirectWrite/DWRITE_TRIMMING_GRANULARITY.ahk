#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the text granularity used to trim text overflowing the layout box.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_trimming_granularity
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
class DWRITE_TRIMMING_GRANULARITY extends Win32Enum {

    /**
     * No trimming occurs. Text flows beyond the layout width.
     * Native name: DWRITE_TRIMMING_GRANULARITY_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Trimming occurs at a character cluster boundary.
     * Native name: DWRITE_TRIMMING_GRANULARITY_CHARACTER
     * @type {Integer (Int32)}
     */
    static CHARACTER => 1

    /**
     * Trimming occurs at a word boundary.
     * Native name: DWRITE_TRIMMING_GRANULARITY_WORD
     * @type {Integer (Int32)}
     */
    static WORD => 2
}
