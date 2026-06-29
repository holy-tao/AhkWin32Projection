#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the word wrapping to be used in a particular multiline paragraph.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_word_wrapping
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_WORD_WRAPPING {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates that words are broken across lines to avoid text overflowing the layout box.
     * @type {Integer (Int32)}
     */
    static DWRITE_WORD_WRAPPING_WRAP => 0

    /**
     * Indicates that words are kept within the same line even when it overflows the layout box. This option is often used with scrolling to reveal overflow text.
     * @type {Integer (Int32)}
     */
    static DWRITE_WORD_WRAPPING_NO_WRAP => 1

    /**
     * <div class="alert"><b>Note</b>  Windows 8.1 and later only.</div>
     * <div> </div>
     * Words are broken across lines to avoid text overflowing the layout box.
     *     Emergency wrapping occurs if the word is larger than the maximum width.
     * @type {Integer (Int32)}
     */
    static DWRITE_WORD_WRAPPING_EMERGENCY_BREAK => 2

    /**
     * <div class="alert"><b>Note</b>  Windows 8.1 and later only.</div>
     * <div> </div>
     * When emergency wrapping, only wrap whole words, never breaking words when the layout width is too small for even a single word.
     * @type {Integer (Int32)}
     */
    static DWRITE_WORD_WRAPPING_WHOLE_WORD => 3

    /**
     * <div class="alert"><b>Note</b>  Windows 8.1 and later only.</div>
     * <div> </div>
     * Wrap between any valid character clusters.
     * @type {Integer (Int32)}
     */
    static DWRITE_WORD_WRAPPING_CHARACTER => 4
}
