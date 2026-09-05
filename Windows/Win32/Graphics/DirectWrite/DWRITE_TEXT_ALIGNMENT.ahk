#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the alignment of paragraph text along the reading direction axis, relative to the leading and trailing edge of the layout box.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_text_alignment
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
class DWRITE_TEXT_ALIGNMENT extends Win32Enum {

    /**
     * The leading edge of the paragraph text is aligned to the leading edge of the layout box.
     * Native name: DWRITE_TEXT_ALIGNMENT_LEADING
     * @type {Integer (Int32)}
     */
    static LEADING => 0

    /**
     * The trailing edge of the paragraph text is aligned to the  trailing edge of the layout box.
     * Native name: DWRITE_TEXT_ALIGNMENT_TRAILING
     * @type {Integer (Int32)}
     */
    static TRAILING => 1

    /**
     * The center of the paragraph text is aligned to the center of the layout box.
     * Native name: DWRITE_TEXT_ALIGNMENT_CENTER
     * @type {Integer (Int32)}
     */
    static CENTER => 2

    /**
     * Align text to the leading side, and also justify text to fill the lines.
     * Native name: DWRITE_TEXT_ALIGNMENT_JUSTIFIED
     * @type {Integer (Int32)}
     */
    static JUSTIFIED => 3
}
