#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DWRITE_CARET_METRICS structure specifies the metrics for caret placement in a font.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/ns-dwrite_1-dwrite_caret_metrics
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_CARET_METRICS {
    #StructPack 2

    /**
     * Vertical rise of the caret in font design units. Rise / Run yields the caret angle. Rise = 1 for perfectly upright fonts (non-italic).
     */
    slopeRise : Int16

    /**
     * Horizontal run of the caret in font design units. Rise / Run yields the caret angle. Run = 0 for perfectly upright fonts (non-italic).
     */
    slopeRun : Int16

    /**
     * Horizontal offset of the caret, in font design units, along the baseline for good appearance. Offset = 0 for perfectly upright fonts (non-italic).
     */
    offset : Int16

}
