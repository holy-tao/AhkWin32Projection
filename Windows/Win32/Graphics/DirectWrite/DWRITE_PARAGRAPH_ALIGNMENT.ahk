#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the alignment of paragraph text along the flow direction axis, relative to the top and bottom of the flow's layout box.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_paragraph_alignment
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_PARAGRAPH_ALIGNMENT {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The top of the text flow is aligned to the top edge of the layout box.
     * @type {Integer (Int32)}
     */
    static DWRITE_PARAGRAPH_ALIGNMENT_NEAR => 0

    /**
     * The bottom of the text flow is aligned to the bottom edge of the layout box.
     * @type {Integer (Int32)}
     */
    static DWRITE_PARAGRAPH_ALIGNMENT_FAR => 1

    /**
     * The center of the flow is aligned to the center of the layout box.
     * @type {Integer (Int32)}
     */
    static DWRITE_PARAGRAPH_ALIGNMENT_CENTER => 2
}
