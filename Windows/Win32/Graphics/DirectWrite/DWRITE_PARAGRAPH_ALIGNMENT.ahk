#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the alignment of paragraph text along the flow direction axis, relative to the top and bottom of the flow's layout box.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_paragraph_alignment
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
class DWRITE_PARAGRAPH_ALIGNMENT extends Win32Enum {

    /**
     * The top of the text flow is aligned to the top edge of the layout box.
     * Native name: DWRITE_PARAGRAPH_ALIGNMENT_NEAR
     * @type {Integer (Int32)}
     */
    static NEAR => 0

    /**
     * The bottom of the text flow is aligned to the bottom edge of the layout box.
     * Native name: DWRITE_PARAGRAPH_ALIGNMENT_FAR
     * @type {Integer (Int32)}
     */
    static FAR => 1

    /**
     * The center of the flow is aligned to the center of the layout box.
     * Native name: DWRITE_PARAGRAPH_ALIGNMENT_CENTER
     * @type {Integer (Int32)}
     */
    static CENTER => 2
}
