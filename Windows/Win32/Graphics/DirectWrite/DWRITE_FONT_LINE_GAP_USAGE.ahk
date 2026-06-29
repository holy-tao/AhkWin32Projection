#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specify whether DWRITE_FONT_METRICS::lineGap value should be part of the line metrics.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/ne-dwrite_3-dwrite_font_line_gap_usage
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_FONT_LINE_GAP_USAGE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The usage of the font line gap depends on the method used for text layout.
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_LINE_GAP_USAGE_DEFAULT => 0

    /**
     * The font line gap is excluded from line spacing.
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_LINE_GAP_USAGE_DISABLED => 1

    /**
     * The font line gap is included in line spacing.
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_LINE_GAP_USAGE_ENABLED => 2
}
