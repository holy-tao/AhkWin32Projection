#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the alignment of paragraph text along the reading direction axis, relative to the leading and trailing edge of the layout box.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_text_alignment
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_TEXT_ALIGNMENT {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The leading edge of the paragraph text is aligned to the leading edge of the layout box.
     * @type {Integer (Int32)}
     */
    static DWRITE_TEXT_ALIGNMENT_LEADING => 0

    /**
     * The trailing edge of the paragraph text is aligned to the  trailing edge of the layout box.
     * @type {Integer (Int32)}
     */
    static DWRITE_TEXT_ALIGNMENT_TRAILING => 1

    /**
     * The center of the paragraph text is aligned to the center of the layout box.
     * @type {Integer (Int32)}
     */
    static DWRITE_TEXT_ALIGNMENT_CENTER => 2

    /**
     * Align text to the leading side, and also justify text to fill the lines.
     * @type {Integer (Int32)}
     */
    static DWRITE_TEXT_ALIGNMENT_JUSTIFIED => 3
}
